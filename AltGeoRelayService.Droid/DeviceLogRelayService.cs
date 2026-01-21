using Android.Content;
using Android.OS;
using Android.Provider;
using Android.Runtime;
using Android.App;
using Newtonsoft.Json;
using System;
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

        internal static bool IsRunning => _cts != null && !_cts.IsCancellationRequested;

        internal static void Start(Context context, string tenantId)
        {
            if (string.IsNullOrWhiteSpace(tenantId))
            {
                throw new ArgumentException("tenantId is required", nameof(tenantId));
            }

            if (IsRunning)
            {
                return;
            }

            _cts = new CancellationTokenSource();
            var appContext = context.ApplicationContext;

            _loopTask = Task.Run(async () =>
            {
                // Send immediately, then every 5 minutes
                await SafePushOnce(appContext, tenantId, _cts.Token).ConfigureAwait(false);

                using var timer = new PeriodicTimer(TimeSpan.FromMinutes(5));
                while (await timer.WaitForNextTickAsync(_cts.Token).ConfigureAwait(false))
                {
                    await SafePushOnce(appContext, tenantId, _cts.Token).ConfigureAwait(false);
                }
            }, _cts.Token);
        }

        internal static void Stop()
        {
            try
            {
                _cts?.Cancel();
            }
            catch
            {
                // ignore
            }
            finally
            {
                _cts = null;
                _loopTask = null;
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
                // ignore
            }
            catch (Exception ex)
            {
                FacadeLogger.Instance.LogMessage($"Relay push failed: {ex.Message}");
            }
        }

        private static async Task PushOnce(Context context, string tenantId, CancellationToken ct)
        {
            // DA2 / Trimble data (nullable if not available)
            var pos = MainModel.Instance.PositionUpdateArgs;
            var da2Connected = pos != null;

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
            }

            int? da2Battery = null;
            try
            {
                var batt = MainModel.Instance.GetExternalReceiverBatteryLevel();
                if (batt > 0) da2Battery = batt;
            }
            catch
            {
                // ignore
            }

            // Mobile GPS data (always included)
            var mobileDeviceId = GetAndroidId(context) ?? "UNKNOWN";
            double? mobileLat = null;
            double? mobileLon = null;
            double? mobileAcc = null;
            try
            {
                var loc = await Geolocation.GetLastKnownLocationAsync().ConfigureAwait(false);
                if (loc == null)
                {
                    var req = new GeolocationRequest(GeolocationAccuracy.Medium, TimeSpan.FromSeconds(10));
                    loc = await Geolocation.GetLocationAsync(req, ct).ConfigureAwait(false);
                }
                if (loc != null)
                {
                    mobileLat = loc.Latitude;
                    mobileLon = loc.Longitude;
                    mobileAcc = loc.Accuracy;
                }
            }
            catch (Exception ex)
            {
                FacadeLogger.Instance.LogMessage($"Mobile location unavailable: {ex.Message}");
            }

            int? mobileBattery = null;
            try
            {
                mobileBattery = (int)Math.Round(Battery.ChargeLevel * 100.0);
            }
            catch
            {
                // ignore
            }

            string mobileBatteryHealth = GetBatteryHealth(context);

            var dataSource = da2Connected ? "TRIMBLE" : "MOBILE_GPS";

            // Survey data (as a JSON array string) - include the most useful raw state we have.
            string surveyData = null;
            try
            {
                var surveyObj = new
                {
                    appGuid = MainModel.AppGuid,
                    position = pos,
                    rtkConnectionStatus = MainModel.Instance.RtkConnectionStatusUpdateArgs?.Status,
                    surveyType = MainModel.Instance.SurveyTypeUpdateArgs?.Status,
                    licenseStatus = MainModel.Instance.LicStatusUpdateArgs?.Status,
                    sensorStatus = MainModel.Instance.SensorStatusUpdateArgs?.Status
                };
                surveyData = JsonConvert.SerializeObject(new[] { surveyObj });
            }
            catch
            {
                // ignore
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

            var json = JsonConvert.SerializeObject(payload);
            using var content = new StringContent(json, Encoding.UTF8, "application/json");

            using var resp = await Http.PostAsync(Endpoint, content, ct).ConfigureAwait(false);
            var body = await resp.Content.ReadAsStringAsync(ct).ConfigureAwait(false);
            if (!resp.IsSuccessStatusCode)
            {
                throw new Exception($"HTTP {(int)resp.StatusCode}: {body}");
            }

            FacadeLogger.Instance.LogMessage($"Relay push ok: {(int)resp.StatusCode}");
        }

        private static double RadToDeg(double rad) => rad * 180.0 / Math.PI;

        private static string GetAndroidId(Context context)
        {
            try
            {
                return Settings.Secure.GetString(context.ContentResolver, Settings.Secure.AndroidId);
            }
            catch
            {
                return null;
            }
        }

        private static string GetBatteryHealth(Context context)
        {
            try
            {
                using var ifilter = new IntentFilter(Intent.ActionBatteryChanged);
                using var batteryStatus = context.RegisterReceiver(null, ifilter);
                if (batteryStatus == null) return null;

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
            catch
            {
                return null;
            }
        }
    }
}


