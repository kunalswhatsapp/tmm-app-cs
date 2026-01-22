using Android.Content;
using Android.OS;
using Android.Provider;
using Android.Runtime;
using Android.App;
using Newtonsoft.Json;
using System;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Xamarin.Essentials;

namespace AltGeoRelayService.Droid
{
    internal static class DeviceLogRelayService
    {
        private const string Endpoint = "https://altgeo-api.hirenq.com/api/DeviceLog/pushdata";
        private static readonly HttpClient Http = new HttpClient();

        private static CancellationTokenSource _cts;
        private static Task _loopTask;

        private static string _lastPayload;
        private static string _lastResponse;
        private static string _lastStatus;
        private static string _lastLogs = "";
        private static readonly object _lock = new object();
        private static readonly object _logLock = new object();

        internal static bool IsRunning => _cts != null && !_cts.IsCancellationRequested;

        public static event EventHandler<ApiDataEventArgs> ApiDataUpdated;

        public class ApiDataEventArgs : EventArgs
        {
            public string Payload { get; set; }
            public string Response { get; set; }
            public string Status { get; set; }
            public string Logs { get; set; }
        }

        public static (string Payload, string Response, string Status, string Logs) GetLastApiData()
        {
            lock (_lock)
            {
                lock (_logLock)
                {
                    return (_lastPayload ?? "No data sent yet", 
                            _lastResponse ?? "No response yet", 
                            _lastStatus ?? "No status",
                            _lastLogs ?? "No logs yet");
                }
            }
        }

        internal static void AddLog(string message)
        {
            var timestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            var logEntry = $"[{timestamp}] {message}\n";
            string currentLogs;
            string currentPayload;
            string currentResponse;
            string currentStatus;
            
            lock (_logLock)
            {
                _lastLogs += logEntry;
                // Keep only last 200 log entries to prevent memory issues
                var lines = _lastLogs.Split('\n');
                if (lines.Length > 200)
                {
                    _lastLogs = string.Join("\n", lines.Skip(lines.Length - 200));
                }
                currentLogs = _lastLogs;
            }
            
            // Get current payload/response/status
            lock (_lock)
            {
                currentPayload = _lastPayload ?? "No data sent yet";
                currentResponse = _lastResponse ?? "No response yet";
                currentStatus = _lastStatus ?? "No status";
            }
            
            // Also log to FacadeLogger
            FacadeLogger.Instance.LogMessage($"RelayService: {message}");
            
            // Notify UI - ensure we're on the main thread context
            try
            {
               MainThread.BeginInvokeOnMainThread(() =>
                {
                    if (ApiDataUpdated != null)
                    {
                        ApiDataUpdated.Invoke(null, new ApiDataEventArgs
                        {
                            Payload = currentPayload,
                            Response = currentResponse,
                            Status = currentStatus,
                            Logs = currentLogs
                        });
                    }
                });
            }
            catch (Exception ex)
            {
                // Log the error to the visible panel - use direct log addition to avoid recursion
                try
                {
                    var errorTimestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    var errorLogEntry = $"[{errorTimestamp}] ERROR in AddLog UI update: {ex.Message}\n";
                    errorLogEntry += $"[{errorTimestamp}] Exception type: {ex.GetType().FullName}\n";
                    if (ex.InnerException != null)
                    {
                        errorLogEntry += $"[{errorTimestamp}] Inner exception: {ex.InnerException.Message}\n";
                    }
                    errorLogEntry += $"[{errorTimestamp}] Stack trace: {ex.StackTrace}\n";
                    
                    string updatedLogs;
                    lock (_logLock)
                    {
                        _lastLogs += errorLogEntry;
                        // Keep only last 200 log entries
                        var lines = _lastLogs.Split('\n');
                        if (lines.Length > 200)
                        {
                            _lastLogs = string.Join("\n", lines.Skip(lines.Length - 200));
                        }
                        updatedLogs = _lastLogs;
                    }
                    
                    // Try to notify UI one more time with the error included
                    try
                    {
                        ApiDataUpdated?.Invoke(null, new ApiDataEventArgs
                        {
                            Payload = currentPayload,
                            Response = currentResponse,
                            Status = currentStatus,
                            Logs = updatedLogs
                        });
                    }
                    catch
                    {
                        // If UI notification fails again, just continue
                    }
                    
                    FacadeLogger.Instance.LogMessage($"RelayService: UI update error: {ex.Message}");
                }
                catch
                {
                    // If even error logging fails, just log to FacadeLogger
                    FacadeLogger.Instance.LogMessage($"RelayService: Critical error in AddLog: {ex.Message}");
                }
            }
        }

        internal static void Start(Context context, string tenantId)
        {
            AddLog("Start button clicked, Start() WAS CALLED");
            try
            {
                lock (_logLock)
                    {
                        _lastLogs = "";
                    }
                AddLog("=== Starting Relay Service ===");
                
                if (string.IsNullOrWhiteSpace(tenantId))
                {
                    var error = "tenantId is required";
                    AddLog($"ERROR: {error}");
                    throw new ArgumentException(error, nameof(tenantId));
                }

                if (IsRunning)
                {
                    AddLog("WARNING: Service already running, ignoring start request");
                    return;
                }

                AddLog($"Starting with tenantId: {tenantId}");
                AddLog($"Endpoint: {Endpoint}");

                // Check network connectivity
                try
                {
                    var connectivity = Connectivity.NetworkAccess;
                    AddLog($"Network access: {connectivity}");
                    if (connectivity != NetworkAccess.Internet)
                    {
                        AddLog($"WARNING: No internet access detected. Current: {connectivity}");
                    }
                }
                catch (Exception ex)
                {
                    AddLog($"WARNING: Could not check network connectivity: {ex.Message}");
                }

                _cts = new CancellationTokenSource();
                var appContext = context.ApplicationContext;

                AddLog("Creating background task...");
                AddLog("Start button clicked, Start() WAS CALLED, Task.Run scheduled");
                _loopTask = Task.Run(async () =>
                {
                    AddLog("Start button clicked, Start() WAS CALLED, Task.Run scheduled, Background task entered");
                    try
                    {
                        AddLog("Background task started successfully");
                        AddLog("Task status: Running");
                        AddLog("Sending initial POST request immediately...");
                        
                        // Send immediately, then every 30 seconds for quick testing
                        await SafePushOnce(appContext, tenantId, _cts.Token).ConfigureAwait(false);

                        AddLog("Initial POST completed successfully");
                        AddLog("Starting 30-second periodic timer...");
                        using var timer = new PeriodicTimer(TimeSpan.FromSeconds(30));
                        AddLog("Timer started, waiting for next tick...");
                        while (await timer.WaitForNextTickAsync(_cts.Token).ConfigureAwait(false))
                        {
                            AddLog("Timer tick received - sending POST request...");
                            await SafePushOnce(appContext, tenantId, _cts.Token).ConfigureAwait(false);
                        }
                    }
                    catch (System.OperationCanceledException)
                    {
                        AddLog("Service stopped (cancellation requested)");
                    }
                    catch (Exception ex)
                    {
                        AddLog($"CRITICAL ERROR in background task: {ex.Message}");
                        AddLog($"Exception type: {ex.GetType().FullName}");
                        if (ex.InnerException != null)
                        {
                            AddLog($"Inner exception: {ex.InnerException.Message}");
                        }
                        AddLog($"Stack trace: {ex.StackTrace}");
                    }
                }, _cts.Token);
                
                // Add continuation to catch any immediate failures
                _loopTask.ContinueWith(task =>
                {
                    if (task.IsFaulted && task.Exception != null)
                    {
                        AddLog($"TASK FAILED IMMEDIATELY: {task.Exception.GetBaseException().Message}");
                        foreach (var innerEx in task.Exception.InnerExceptions)
                        {
                            AddLog($"Inner exception: {innerEx.Message}");
                        }
                    }
                    else if (task.IsCanceled)
                    {
                        AddLog("Task was cancelled");
                    }
                    else if (task.IsCompleted)
                    {
                        AddLog("Task completed normally");
                    }
                }, TaskContinuationOptions.ExecuteSynchronously);
                
                AddLog("Relay Service start command completed");
                AddLog("Background task created and scheduled");
            }
            catch (Exception ex)
            {
                AddLog($"ERROR starting service: {ex.Message}");
                AddLog($"Exception type: {ex.GetType().FullName}");
                if (ex.InnerException != null)
                {
                    AddLog($"Inner exception: {ex.InnerException.Message}");
                }
                AddLog($"Stack trace: {ex.StackTrace}");
                throw;
            }
        }

        internal static void Stop()
        {
            try
            {
                AddLog("=== Stopping Relay Service ===");
                _cts?.Cancel();
                AddLog("Cancellation token set");
            }
            catch (Exception ex)
            {
                AddLog($"ERROR stopping service: {ex.Message}");
            }
            finally
            {
                _cts = null;
                _loopTask = null;
                AddLog("Relay Service stopped");
            }
        }

        private static async Task SafePushOnce(Context context, string tenantId, CancellationToken ct)
        {
            try
            {
                await PushOnce(context, tenantId, ct).ConfigureAwait(false);
            }
            catch (System.OperationCanceledException)
            {
                AddLog("POST request cancelled");
            }
            catch (Exception ex)
            {
                AddLog($"ERROR in POST request: {ex.Message}");
                AddLog($"Exception type: {ex.GetType().Name}");
                if (ex.InnerException != null)
                {
                    AddLog($"Inner exception: {ex.InnerException.Message}");
                }
                AddLog($"Stack trace: {ex.StackTrace}");
                FacadeLogger.Instance.LogMessage($"Relay push failed: {ex.Message}");
            }
        }

        private static async Task PushOnce(Context context, string tenantId, CancellationToken ct)
        {
            AddLog("--- Starting new POST request ---");
            AddLog("Step 1: Gathering DA2/Trimble data...");
            // DA2 / Trimble data (nullable if not available)
            var pos = MainModel.Instance.PositionUpdateArgs;
            var da2Connected = pos != null;
            try
            {
                AddLog($"DA2 connected: {da2Connected}");
                
                if (pos != null)
                {
                    AddLog($"Position data available:");
                    AddLog($"  - Latitude: {RadToDeg(pos.Latitude)}");
                    AddLog($"  - Longitude: {RadToDeg(pos.Longitude)}");
                    AddLog($"  - Height: {pos.Height}");
                    AddLog($"  - Solution: {pos.Solution}");
                    AddLog($"  - Fix Type: {pos.GroundPositionType}");
                    AddLog($"  - Satellites: {pos.NumberSatellites}");
                    AddLog($"  - Horizontal Precision: {pos.HorizontalPrecision}");
                    AddLog($"  - Vertical Precision: {pos.VerticalPrecision}");
                    AddLog($"  - Correction Age: {pos.CorrectionAge}");
                    AddLog($"  - UTC Time: {pos.UtcTime}");
                }
                else
                {
                    AddLog("No DA2/Trimble position data available");
                }
            }
            catch (Exception ex)
            {
                AddLog($"ERROR getting DA2/Trimble data: {ex.Message}");
            }

            double da2LatDeg = 0.0;
            double da2LonDeg = 0.0;
            string timestamp = null;
            string solutionType = null;
            string fixType = null;
            double? height = null;
            double? hPrecision = null;
            double? vPrecision = null;
            double? correctionAge = null;
            int? satellites = null;
            double horizAcc = 0.0;
            double vertAcc = 0.0;
            if (pos != null)
            {
                try
                {
                    da2LatDeg = RadToDeg(pos.Latitude);
                    da2LonDeg = RadToDeg(pos.Longitude);
                    timestamp = pos.UtcTime.ToString("O");
                    solutionType = pos.Solution.ToString();
                    fixType = pos.GroundPositionType.ToString();
                    height = pos.Height;
                    hPrecision = pos.HorizontalPrecision;
                    vPrecision = pos.VerticalPrecision;
                    correctionAge = pos.CorrectionAge;
                    satellites = pos.NumberSatellites;
                    horizAcc = pos.HorizontalPrecision;
                    vertAcc = pos.VerticalPrecision;
                    AddLog("DA2 position data extracted successfully");
                }
                catch (Exception ex)
                {
                    AddLog($"ERROR extracting DA2 position data: {ex.Message}");
                }
            }

            int? da2Battery = null;
            try
            {
                var batt = MainModel.Instance.GetExternalReceiverBatteryLevel();
                if (batt > 0) da2Battery = batt;
                AddLog($"DA2 battery: {da2Battery}%");
            }
            catch (Exception ex)
            {
                AddLog($"WARNING: Could not get DA2 battery: {ex.Message}");
            }

            AddLog("Step 2: Gathering mobile GPS data...");
            // Mobile GPS data (always included)
            var mobileDeviceId = GetAndroidId(context) ?? "UNKNOWN";
            AddLog($"Mobile device ID: {mobileDeviceId}");
            double? mobileLat = null;
            double? mobileLon = null;
            double? mobileAcc = null;
            try
            {
                AddLog("Attempting to get last known location...");
                var loc = await Geolocation.GetLastKnownLocationAsync().ConfigureAwait(false);
                if (loc == null)
                {
                    AddLog("Last known location not available, requesting new location...");
                    var req = new GeolocationRequest(GeolocationAccuracy.Medium, TimeSpan.FromSeconds(10));
                    loc = await Geolocation.GetLocationAsync(req, ct).ConfigureAwait(false);
                }
                if (loc != null)
                {
                    mobileLat = loc.Latitude;
                    mobileLon = loc.Longitude;
                    mobileAcc = loc.Accuracy;
                    AddLog($"Mobile GPS location obtained:");
                    AddLog($"  - Latitude: {mobileLat}");
                    AddLog($"  - Longitude: {mobileLon}");
                    AddLog($"  - Accuracy: {mobileAcc}m");
                }
                else
                {
                    AddLog("WARNING: Mobile location is null after request");
                }
            }
            catch (Exception ex)
            {
                AddLog($"WARNING: Mobile location unavailable: {ex.Message}");
                AddLog($"Exception type: {ex.GetType().Name}");
                FacadeLogger.Instance.LogMessage($"Mobile location unavailable: {ex.Message}");
            }

            int? mobileBattery = null;
            try
            {
                mobileBattery = (int)Math.Round(Battery.ChargeLevel * 100.0);
                AddLog($"Mobile battery: {mobileBattery}%");
            }
            catch (Exception ex)
            {
                AddLog($"WARNING: Could not get mobile battery: {ex.Message}");
            }

            string mobileBatteryHealth = GetBatteryHealth(context);
            AddLog($"Mobile battery health: {mobileBatteryHealth ?? "Unknown"}");

            var dataSource = da2Connected ? "TRIMBLE" : "MOBILE_GPS";
            AddLog($"Data source: {dataSource}");

            AddLog("Step 3: Building survey data...");
            // Survey data (as a JSON array string) - include the most useful raw state we have.
            string surveyData = null;
            try
            {
                AddLog("Collecting survey status information...");
                var surveyObj = new
                {
                    appGuid = MainModel.AppGuid,
                    position = pos,
                    rtkConnectionStatus = MainModel.Instance.RtkConnectionStatusUpdateArgs?.Status,
                    surveyType = MainModel.Instance.SurveyTypeUpdateArgs?.Status,
                    licenseStatus = MainModel.Instance.LicStatusUpdateArgs?.Status,
                    sensorStatus = MainModel.Instance.SensorStatusUpdateArgs?.Status
                };
                AddLog("Serializing survey data to JSON...");
                surveyData = JsonConvert.SerializeObject(new[] { surveyObj });
                AddLog($"Survey data serialized successfully ({surveyData.Length} bytes)");
            }
            catch (Exception ex)
            {
                AddLog($"WARNING: Could not serialize survey data: {ex.Message}");
                AddLog($"Exception type: {ex.GetType().Name}");
                if (ex.InnerException != null)
                {
                    AddLog($"Inner exception: {ex.InnerException.Message}");
                }
            }

            var payload = new
            {
                tenantId = tenantId,
                dataSource = dataSource,
                surveyData = surveyData,

                deviceId = da2Connected ? MainModel.Instance.ConnectedDeviceId : null,
                latitude = da2LatDeg,
                longitude = da2LonDeg,
                battery = da2Battery,
                fixType = fixType,
                timestamp = timestamp,
                health = da2Connected ? "CONNECTED" : null,
                horizontalAccuracy = horizAcc,
                verticalAccuracy = vertAcc,
                satellites = satellites,
                solutionType = solutionType,
                height = height,
                hPrecision = hPrecision,
                vPrecision = vPrecision,
                correctionAge = correctionAge,
                userId = MainModel.Instance.CurrentUser,
                userName = (string)null,
                userEmail = (string)null,

                mobileDeviceId = mobileDeviceId,
                mobileLatitude = mobileLat,
                mobileLongitude = mobileLon,
                mobileAccuracy = mobileAcc,
                mobileBattery = mobileBattery,
                mobileBatteryHealth = mobileBatteryHealth
            };

            AddLog("Step 4: Building payload object...");
            try
            {
                AddLog("Creating payload with all collected data...");
                // Payload object is already created above
                AddLog("Payload object created successfully");
            }
            catch (Exception ex)
            {
                AddLog($"ERROR creating payload object: {ex.Message}");
                throw;
            }

            AddLog("Step 5: Serializing payload to JSON...");
            string json;
            try
            {
                json = JsonConvert.SerializeObject(payload, Formatting.Indented);
                AddLog($"Payload serialized successfully: {json.Length} bytes");
            }
            catch (Exception ex)
            {
                AddLog($"ERROR serializing payload: {ex.Message}");
                AddLog($"Exception type: {ex.GetType().Name}");
                throw;
            }

            AddLog("Step 6: Creating HTTP request content...");
            StringContent content;
            try
            {
                content = new StringContent(json, Encoding.UTF8, "application/json");
                AddLog("HTTP content created successfully");
            }
            catch (Exception ex)
            {
                AddLog($"ERROR creating HTTP content: {ex.Message}");
                throw;
            }

            // Store payload
            lock (_lock)
            {
                _lastPayload = json;
            }

            AddLog($"Step 7: Sending POST request to {Endpoint}...");
            AddLog($"Request timeout: {Http.Timeout.TotalSeconds} seconds");
            HttpResponseMessage resp;
            try
            {
                using (content)
                {
                    AddLog("Initiating HTTP POST...");
                    resp = await Http.PostAsync(Endpoint, content, ct).ConfigureAwait(false);
                    AddLog($"POST request completed, status: {(int)resp.StatusCode}");
                }
            }
            catch (TaskCanceledException ex)
            {
                AddLog($"ERROR: POST request timed out or was cancelled");
                AddLog($"Exception: {ex.Message}");
                throw;
            }
            catch (HttpRequestException ex)
            {
                AddLog($"ERROR: HTTP request failed");
                AddLog($"Exception: {ex.Message}");
                if (ex.InnerException != null)
                {
                    AddLog($"Inner exception: {ex.InnerException.Message}");
                }
                throw;
            }
            catch (Exception ex)
            {
                AddLog($"ERROR: Unexpected exception during POST");
                AddLog($"Exception type: {ex.GetType().FullName}");
                AddLog($"Exception message: {ex.Message}");
                if (ex.InnerException != null)
                {
                    AddLog($"Inner exception: {ex.InnerException.Message}");
                }
                throw;
            }
            
            AddLog("Step 8: Reading response...");
            string body;
            try
            {
                using (resp)
                {
                    body = await resp.Content.ReadAsStringAsync(ct).ConfigureAwait(false);
                    AddLog($"Response body read successfully: {body.Length} bytes");
                }
            }
            catch (Exception ex)
            {
                AddLog($"ERROR reading response: {ex.Message}");
                throw;
            }
            
            // Store response and status
            var statusText = $"HTTP {(int)resp.StatusCode} {resp.ReasonPhrase}";
            AddLog($"Response status: {statusText}");
            
            lock (_lock)
            {
                _lastResponse = body;
                _lastStatus = statusText;
            }

            // Notify UI thread
            try
            {
                lock (_logLock)
                {
                    ApiDataUpdated?.Invoke(null, new ApiDataEventArgs
                    {
                        Payload = json,
                        Response = body,
                        Status = statusText,
                        Logs = _lastLogs
                    });
                    AddLog("UI notified of data update");
                }
            }
            catch (Exception ex)
            {
                AddLog($"WARNING: UI update failed: {ex.Message}");
            }

            if (!resp.IsSuccessStatusCode)
            {
                var error = $"HTTP {(int)resp.StatusCode}: {body}";
                AddLog($"ERROR: Server returned error status");
                AddLog($"Error details: {error}");
                throw new Exception(error);
            }

            AddLog($"SUCCESS: POST completed successfully with status {resp.StatusCode}");
            AddLog("--- POST request completed ---");
            FacadeLogger.Instance.LogMessage($"Relay push ok: {(int)resp.StatusCode}");
        }

        private static double RadToDeg(double rad) => rad * 180.0 / Math.PI;

        private static string GetAndroidId(Context context)
        {
            try
            {
                return Settings.Secure.GetString(context.ContentResolver, Settings.Secure.AndroidId);
            }
            catch (Exception ex)
            {
                AddLog($"ERROR getting Android ID: {ex.Message}");
                AddLog($"Exception type: {ex.GetType().Name}");
                if (ex.InnerException != null)
                {
                    AddLog($"Inner exception: {ex.InnerException.Message}");
                }
                return null;
            }
        }

        private static string GetBatteryHealth(Context context)
        {
            try
            {
                using var ifilter = new IntentFilter(Intent.ActionBatteryChanged);
                using var batteryStatus = context.RegisterReceiver(null, ifilter);
                if (batteryStatus == null)
                {
                    AddLog("WARNING: Battery status receiver returned null");
                    return null;
                }

                var health = batteryStatus.GetIntExtra(BatteryManager.ExtraHealth, (int)BatteryHealth.Unknown);
                return health switch
                {
                    (int)BatteryHealth.Good => "GOOD",
                    (int)BatteryHealth.Overheat => "OVERHEAT",
                    (int)BatteryHealth.Dead => "DEAD",
                    (int)BatteryHealth.OverVoltage => "OVER_VOLTAGE",
                    (int)BatteryHealth.UnspecifiedFailure => "FAILURE",
                    (int)BatteryHealth.Cold => "COLD",
                    _ => "UNKNOWN"
                };
            }
            catch (Exception ex)
            {
                AddLog($"ERROR getting battery health: {ex.Message}");
                AddLog($"Exception type: {ex.GetType().Name}");
                if (ex.InnerException != null)
                {
                    AddLog($"Inner exception: {ex.InnerException.Message}");
                }
                return null;
            }
        }
    }
}


