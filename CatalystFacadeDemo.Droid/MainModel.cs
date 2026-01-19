using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using Android.Content;
using CatalystFacade;
using Java.Util;
using Trimble.Ssi.Connection;
using Trimble.Ssi.Interfaces.Gnss.Satellites;
using Enum = System.Enum;
using Exception = System.Exception;
using Math = System.Math;
using String = System.String;
using Thread = System.Threading.Thread;
using System.Globalization;
using Android.OS;
using Android.Util;
using Trimble.Ssi.Interfaces.Gnss;
using Trimble.Ssi.Interfaces.Subscriptions;
using Android.Widget;
using Java.IO;
using Java.Util.Zip;
using Trimble.Ssi.Interfaces.Gnss.Positioning;
using File = System.IO.File;
using Xamarin.Essentials;
using Email = Xamarin.Essentials.Email;
using EmailAttachment = Xamarin.Essentials.EmailAttachment;
using EmailMessage = Xamarin.Essentials.EmailMessage;
using MainThread = Xamarin.Essentials.MainThread;
using FilePicker = Xamarin.Essentials.FilePicker;
using PickOptions = Xamarin.Essentials.PickOptions;


namespace CatalystFacadeDemo.Droid
{
    partial class MainModel : IDisposable
    {
        internal class StatusUpdateArgs : EventArgs
        {
            public StatusUpdateArgs(DriverReturnCode returnCode, string status)
            {
                ReturnCode = returnCode;
                Status = status;
            }

            internal DriverReturnCode ReturnCode { get; private set; }
            internal string Status { get; private set; }
        }

        private static MainModel _instance;

        internal const string SubscriptionType = "SubscriptionType";
        internal const string DriverType = "DriverType";
        internal const string ConnectionType = "ConnectionType";
        internal const string DeviceAddress = "DeviceAddress";
        internal const string DeviceName = "DeviceName";
        internal const string DevicePortNo = "DevicePortNo";
        internal const string NtripServer = "NtripServer";
        internal const string NtripPort = "NtripPort";
        internal const string NtripUser = "NtripUser";
        internal const string NtripPassword = "NtripPassword";
        internal const string NtripSource = "NtripSource";
        internal const string SurveyType = "SurveyType";
        internal const string TargetReferenceFrame = "TargetReferenceFrame";
        internal const string TargetReferenceFrameId = "TargetReferenceFrameId";
        internal const string GeoidGridFileFullPath = "GeoidGridFileFullPath";
        internal const string ReducedAntennaHeight = "ReducedAntennaHeight";
        internal const string EnableDriverLogs = "EnableDriverLogs";

        internal enum SubscriptionTypes
        {
            User = 0,
            Device = 1,
            OffTheShelf = 2,
        }

        internal enum SurveyTypes
        {
            TrimbleCorrectionHub,
            RtxViaInternet,
            RtxViaSatellite,
            RtkViaNtrip
        }

        internal const string AppGuid = "9e8f6464-3f76-4f33-9d13-d19ab764144b";

        internal enum ConnectionTypes
        {
            Bluetooth,
            TcpIp
        }


        private string _configFilePath;
        private string _mountPointCachePath;
        private string _positionLogPath;
        private Context _applicationContext;
        private CatalystFacade.Droid.CatalystFacade _catalystFacade;
        private string _progressMsg;
        private readonly object _progressLock = new object();
        private bool _bIsGoStatic;

        internal event EventHandler<StatusUpdateArgs> LicenseStatusHandler;
        internal event EventHandler<StatusUpdateArgs> SensorStatusHandler;
        internal event EventHandler<StatusUpdateArgs> SurveyStatusHandler;
        internal event EventHandler<PositionUpdateArgs> PositionUpdateHandler;
        internal event EventHandler<StatusUpdateArgs> RtkConnectionStatusHandler;
        internal event EventHandler<StatusUpdateArgs> SurveyTypeHandler;

        internal event EventHandler<SatelliteSummaryUpdateArgs> SatelliteSummaryUpdateHandler;
        private readonly ManualResetEvent _waitForPermissions = new ManualResetEvent(false);
        internal StatusUpdateArgs LicStatusUpdateArgs { get; private set; }
        internal StatusUpdateArgs SensorStatusUpdateArgs { get; private set; }
        internal StatusUpdateArgs SurveyTypeUpdateArgs { get; private set; }

        public StatusUpdateArgs RtkConnectionStatusUpdateArgs { get; private set; }
        internal PositionUpdateArgs PositionUpdateArgs { get; private set; }

        internal StatusUpdateArgs SurveyStatusUpdateArgs { get; private set; }

        internal StatusUpdateArgs ClaimStatusUpdateArgs { get; set; }

        internal SatelliteSummaryUpdateArgs SatelliteSummaryUpdateArgs { get; private set; }

        private readonly Stack<string> _progressMessages = new Stack<string>();
        private BlockingCollection<string> _positionUpdates = new BlockingCollection<string>(new ConcurrentQueue<string>());
        private string _pointName;
        private bool _licReady;
        private string _currentClaim;
        private SubscriptionTypes _usedSubscriptionType;
        private const int BUFFER = 2048;

        private string ConfigFilePath => _configFilePath = _configFilePath ?? Path.Combine(_applicationContext.FilesDir.AbsolutePath, "Config.properties");
        private string MountPointCachePath => _mountPointCachePath = _mountPointCachePath ?? Path.Combine(_applicationContext.FilesDir.AbsolutePath, "MountPoints");

        private string PositionLogPath
        {
            get
            {
                if (_positionLogPath == null)
                {
                    var folder = Path.Combine(_applicationContext.GetExternalFilesDir(null).AbsolutePath, "PositionLog");
                    if (!Directory.Exists(folder))
                    {
                        Directory.CreateDirectory(folder);
                    }
                    _positionLogPath = Path.Combine(folder, $"PositionLog_{DateTime.Now:yyyyMMddHHmmss}.csv");
                }
                return _positionLogPath;
            }
        }

        public Task Permission()
        {
            Task task = new Task(() =>
            {
                _waitForPermissions.WaitOne();
            });
            task.Start();
            return task;
        }

        internal static MainModel Instance => _instance ?? (_instance = new MainModel());

        internal string ProgressMsg
        {
            get
            {
                lock (_progressLock)
                {
                    return _progressMsg;
                }
            }
            private set
            {
                lock (_progressLock)
                {
                    if (value == null)
                    {
                        _progressMsg = null;
                        if (_progressMessages.Count != 0)
                        {
                            _progressMsg = _progressMessages.Pop();
                        }
                    }
                    else
                    {
                        if (_progressMsg != null)
                        {
                            _progressMessages.Push(_progressMsg);
                        }
                        _progressMsg = value;
                    }
                    ProgressMsgChanged?.Invoke(this, new ProgressMsgChange(_progressMsg));
                }
            }
        }

        internal string InstallRTXSubscription(string optionCode)
        {
            var errorCode = _catalystFacade.InstallSubscriptions(optionCode);

            if (errorCode == DriverReturnCode.Success)
            {
                return null;
            }

            return errorCode.ToString();
        }

        internal string GetRTXSubscriptions()
        {
            var errorCode = _catalystFacade.GetRTXSubscriptions(out List<ISubscription> subscriptions);

            if (errorCode == DriverReturnCode.Success)
            {
                return subscriptions.Select(x => x.SubscriptionType.ToString()).Aggregate((x,y) => x + " " + y);
            }

            return errorCode.ToString();
        }

        public string PointName
        {
            get { return _pointName; }
        }

        public string TpskVersion {
            get { return _catalystFacade.Version(); }
        }

        internal event EventHandler<ProgressMsgChange> ProgressMsgChanged;

        internal class ProgressMsgChange : EventArgs
        {
            public ProgressMsgChange(string msg)
            {
                Msg = msg;
            }

            public string Msg { get; private set; }
        }

        private MainModel()
        {
            _positionUpdates.Add(
                    "LogTimeStamp,GpsTime,PointName,Solution,Lat,Lon,Height,GroundPositionType,HPrecision,VPrecision,SSemiMajorAxis,SSemiMinorAxis,SOrientation,InertialMeasurementUnitState,Pitch,Roll,Yaw,PitchPrecision,RollPrecision,YawPrecision," +
                    "Satellites,SatellitesTracked,StaticEpochs,CorrectionAge,CorrectionDataCount,IsTransformationApplied,ReferenceFrameID,TargetReferenceEpoch,MSLHeight");
            RunOnThread(async () =>
            {
                await Permission();
                while (!_positionUpdates.IsCompleted)
                {
                    try
                    {
                        var positionUpdate = _positionUpdates.Take();
                        using (var wr = File.AppendText(PositionLogPath))
                        {
                            wr.WriteLine(positionUpdate);
                        }
                    }
                    catch (Exception)
                    {

                    }
                }

                // Reset for next log
                _bIsGoStatic = false;
            }, true);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                _positionUpdates?.CompleteAdding();
                _positionUpdates = null;
            }
        }


        internal void Init(Context applicationContext)
        {
            _applicationContext = applicationContext;
            if (_catalystFacade != null)
            {
                _catalystFacade.ReleaseDriver();
            }

            var config = ReadConfig();
            var subscriptionTypeStr = config.GetProperty(SubscriptionType, SubscriptionTypes.User.ToString());
            _usedSubscriptionType = (SubscriptionTypes)Enum.Parse(typeof(SubscriptionTypes), subscriptionTypeStr, true);
            _catalystFacade = new CatalystFacade.Droid.CatalystFacade(AppGuid, applicationContext);
            FacadeLogger.Instance.Initialize(applicationContext);
            FacadeLogger.Instance.LogMessage($"Initializing Facade. TPSDK Version: {this.TpskVersion }");
        }

        private void ReInit()
        {
            if (_catalystFacade != null && _catalystFacade.IsSensorConnected())
            {
                Disconnect();
                _catalystFacade.ReleaseDriver();
            }
            var config = ReadConfig();
            var subscriptionTypeStr = config.GetProperty(SubscriptionType, SubscriptionTypes.User.ToString());
            _usedSubscriptionType = (SubscriptionTypes)Enum.Parse(typeof(SubscriptionTypes), subscriptionTypeStr, true);
            _licReady = false;
            LicStatusUpdateArgs = null;
            SensorStatusUpdateArgs = null;
            TriggerLicenseStatusHandler();
            TriggerSensorStatusHandler();
        }


        internal SubscriptionTypes UsedSubscriptionType
        {
            get => _usedSubscriptionType;
            set => _usedSubscriptionType = value;
        }

        public string HostSerial
        {
            get
            {
                try
                { 
                    return _catalystFacade.HostSerial();
                }
                catch (Trimble.Ssi.LicenseException)
                {
                    return "Could not load License";
                }
            }
        }

        public string GetConfiguredReceiverName()
        {
            Properties config = ReadConfig();
            if (!Enum.TryParse(config.GetProperty(DriverType), out DriverType driverType))
            {
                driverType = CatalystFacade.DriverType.TrimbleGNSS;//default
            }
            String receiverName = _catalystFacade.GetReceiverName(driverType, config.GetProperty(DeviceName));
            return receiverName;
        }

        internal void BeginLoadSubcription(string userTID)
        {
            RunOnThread(() => LoadSubscription(userTID));
        }


        private void LoadSubscription(string userTID)
        {
            
            if (userTID == null)
            {
                TriggerLicenseStatusHandler(DriverReturnCode.Error, "Loading Subscription Failed");
                return;
            }
            ProgressMsg = "Loading Subscription";
            DriverReturnCode retCode = DriverReturnCode.Success;
            string licenseInformation = "";
            if (UsedSubscriptionType == SubscriptionTypes.User)
            {
                retCode = _catalystFacade.LoadSubscriptionFromTrimbleMobileManager(userTID);
            }
            else if (UsedSubscriptionType == SubscriptionTypes.Device)
            {
                var deviceLicense = GetDeviceLicense();
                if (string.IsNullOrEmpty(deviceLicense))
                    retCode = DriverReturnCode.ErrorCancelledFromUser;
                else
                {
                    string subscriptionName;
                    DateTime issueDate;
                    DateTime expiryDate;
                    retCode = _catalystFacade.LoadDeviceSubscription(deviceLicense, out subscriptionName, out issueDate, out expiryDate);
                    licenseInformation = $"\n{subscriptionName}:issue {issueDate}:expiry {expiryDate}";
                }
            }
            else
            {
                retCode = _catalystFacade.LoadSubscription();
            }

            if (retCode == DriverReturnCode.Success)
            {
                _licReady = true;
                CurrentUser = userTID;
            }
            else
            {
                _licReady = false;
                CurrentUser = null;
            }

            TriggerLicenseStatusHandler(retCode,
                retCode == DriverReturnCode.Success ? "Subscription Loaded" + licenseInformation : "Loading Subscription Failed");
            if (retCode == DriverReturnCode.Success)
            {
                var config = ReadConfig();
                string deviceTypeStr = null;
                if (null == config || null == (deviceTypeStr = config.GetProperty(DriverType)))
                {
                    TriggerSensorStatusHandler(retCode, "Unknown device type");
                    return;
                }

                if (!Enum.TryParse(deviceTypeStr, out DriverType driverType))
                {
                    driverType = CatalystFacade.DriverType.TrimbleGNSS;//default
                }
                retCode = _catalystFacade.InitDriver(driverType);
                TriggerSensorStatusHandler(retCode,
                        retCode == DriverReturnCode.Success ? $"{deviceTypeStr} driver loaded" : $"Unable to load {deviceTypeStr} driver");
            }
            ProgressMsg = null;
        }

        public string CurrentUser { get; set; }


        public void SetCurrentClaim(string currentClaim)
        {
            _currentClaim = currentClaim;
            if (currentClaim != null)
            {
                TriggerClaimStatusHandler(DriverReturnCode.Success, "Claim:" + currentClaim);
            } else {
                TriggerLicenseStatusHandler(LicStatusUpdateArgs.ReturnCode,LicStatusUpdateArgs.Status);
            }
        }

        private void TriggerLicenseStatusHandler(DriverReturnCode retCode, string status = null)
        {
            LicStatusUpdateArgs = new StatusUpdateArgs(retCode, status);
            LicenseStatusHandler?.Invoke(this, LicStatusUpdateArgs);
        }

        private void TriggerLicenseStatusHandler()
        {
            LicStatusUpdateArgs = null;
            LicenseStatusHandler?.Invoke(this, LicStatusUpdateArgs);
        }

        private void TriggerClaimStatusHandler(DriverReturnCode retCode, string status = null)
        {
            ClaimStatusUpdateArgs = new StatusUpdateArgs(retCode, status);
            LicenseStatusHandler?.Invoke(this, ClaimStatusUpdateArgs);
        }

        

        internal void BeginConnect()
        {
            RunOnThread(Connect);
        }

        private void Connect()
        {
            ProgressMsg = "Connecting";            

            var config = ReadConfig();
            if (null == config )
            {
                TriggerSensorStatusHandler(DriverReturnCode.Error, "Unable to connect");
                FacadeLogger.Instance.LogMessage("Unable to connect -- config was null");
                ProgressMsg = null;
                return;
            }

            var driverType = ParseDriverType(config);

            DriverReturnCode retCode = DriverReturnCode.Error;
            if (driverType == CatalystFacade.DriverType.Catalyst ||
                driverType == CatalystFacade.DriverType.EM100 ||
                driverType == CatalystFacade.DriverType.TDC150)
            {
                retCode = _catalystFacade.Connect();
            }
            else if (driverType == CatalystFacade.DriverType.TrimbleGNSS ||
                     driverType == CatalystFacade.DriverType.SpectraPrecision)
            {
                string connectionType = config.GetProperty(ConnectionType);
                if (connectionType == null )
                {
                    TriggerSensorStatusHandler(DriverReturnCode.Error, "Unable to connect");
                    FacadeLogger.Instance.LogMessage("Unable to connect -- config connectiontype was null");
                    ProgressMsg = null;
                    return;
                }
                ConnectionTypes connType = (ConnectionTypes)Enum.Parse(typeof(ConnectionTypes), connectionType);

                switch (connType)
                {
                    case ConnectionTypes.Bluetooth:
                        retCode = _catalystFacade.ConnectViaBluetooth(config.GetProperty(DeviceAddress));
                        break;
                    case ConnectionTypes.TcpIp:
                        retCode = _catalystFacade.ConnectViaWifi(config.GetProperty(DeviceAddress), config.GetProperty(DevicePortNo));
                        break;
                }
            }
            else if (driverType == CatalystFacade.DriverType.Mock)
            {
                retCode = _catalystFacade.ConnectMock();
            }

            if (retCode != DriverReturnCode.Success)
            {
                TriggerSensorStatusHandler(retCode, "Unable to connect");
                ProgressMsg = null;
                return;
            }

            string instrumentName;
            string serialNumber;
            string firmWare;
            bool licensed;
            _catalystFacade.GetSensorProperties(out instrumentName, out serialNumber, out firmWare, out licensed);
            if (licensed)
            {
                TriggerSensorStatusHandler(retCode, $"Connected to {instrumentName}:{serialNumber}:FW-{firmWare}");
            }
            else
            {
                _catalystFacade.DisconnectFromSensor();
                TriggerSensorStatusHandler(DriverReturnCode.ErrorNoLicense, "The instrument is not licensed");
                ProgressMsg = null;
                return;
            }

            SetReducedAntennaHeight();

            _catalystFacade.PositionUpdate += CatalystFacadeOnPositionUpdate;
            _catalystFacade.UsbConnectionErrorOccured += CatalystFacadeOnUsbConnectionErrorOccured;
            _catalystFacade.SubscriptionHasExpired += CatalystFacadeOnSubscriptionHasExpired;
            _catalystFacade.SensorIsOutsideGeofence += CatalystFacadeOnSensorIsOutsideGeofence;
            _catalystFacade.SensorStateChanged += CatalystFacadeOnSensorStateChanged;
            _catalystFacade.RtkConnectionStatusUpdate +=CatalystFacadeOnRtkConnectionStatusUpdate;
            _catalystFacade.SatelliteUpdate +=CatalystFacadeOnSatelliteUpdate;
            _catalystFacade.RtkServiceAvailable +=CatalystFacadeOnRtkServiceAvailable;
            _catalystFacade.RtxServiceAvailable +=CatalystFacadeOnRtxServiceAvailable;
            _catalystFacade.SurveyTypeUpdate += CatalystFacadeOnSurveyTypeUpdate;

            //Setting position rate. Default value even without calling this function is 1 HZ
            DriverReturnCode returnCode = _catalystFacade.SetOutputPositionRate(PositionRate.OneHz);
            if(returnCode != DriverReturnCode.Success) {
                TriggerSensorStatusHandler(returnCode, "Unable to set output position rate");
            }

            ProgressMsg = null;
        }

       
        private void CatalystFacadeOnSurveyTypeUpdate(object sender, SurveyTypeUpdateArgs surveyTypeUpdateArgs)
        {
            TriggerSurveyTypeHandler(DriverReturnCode.Success,surveyTypeUpdateArgs.SurveyType.ToString());
        }

        

        private void CatalystFacadeOnRtxServiceAvailable(object sender, EventArgs eventArgs)
        {
            TriggerSurveyStatusHandler(DriverReturnCode.Success,"Rtx Service Available");
        }

        private void CatalystFacadeOnRtkServiceAvailable(object sender, EventArgs eventArgs)
        {
            TriggerSurveyStatusHandler(DriverReturnCode.Success, "Rtk Service Available");
        }

        private void CatalystFacadeOnSatelliteUpdate(object sender, SatelliteUpdateArgs satelliteUpdateArgs)
        {
            var satellites = satelliteUpdateArgs.Satellites;
            Dictionary<String, SatelliteSummary> summary = new Dictionary<string, SatelliteSummary>();

            foreach (ISatellite satellite in satellites)
            {
                String key = String.Format("{0}", satellite.SatelliteTypeChar);
                if (!summary.ContainsKey(key))
                {
                    summary.Add(key, new SatelliteSummary(satellite.SatelliteTypeChar));
                }

                if (satellite.Enabled)
                {
                    summary[key].Tracked++;
                }
                
                if (satellite.Used)
                {
                    summary[key].Used++;
                }
            }
            SatelliteSummaryUpdateArgs = new SatelliteSummaryUpdateArgs(summary);
            SatelliteSummaryUpdateHandler?.Invoke(this,SatelliteSummaryUpdateArgs);
        }


        private void SetReducedAntennaHeight()
        {
            var config = ReadConfig();
            string reduceAntennaHeightStr;
            if (config != null && (reduceAntennaHeightStr = config.GetProperty(ReducedAntennaHeight)) != null)
            {
                double.TryParse(reduceAntennaHeightStr, NumberStyles.Any, CultureInfo.InvariantCulture, out double reducedAntennaHeight);
                _catalystFacade.ReducedAntennaHeight = reducedAntennaHeight;
            }
        }

        private DriverType? ReadDriverTypeFromConfig()
        {
            var config = ReadConfig();

            return ParseDriverType(config);
        }

        private DriverType? ParseDriverType(Java.Util.Properties config)
        {
            string deviceTypeStr = config?.GetProperty(DriverType);
            if (string.IsNullOrWhiteSpace(deviceTypeStr))
            {
                return null;
            }
            if (Enum.TryParse(deviceTypeStr, true, out DriverType driverType))
            {
                return driverType;
            }
            return null;
        }


        internal bool IsCatalystDA1Selected()
        {
            var driverType = ReadDriverTypeFromConfig();

            return (driverType == CatalystFacade.DriverType.Catalyst);
        }

        private void CatalystFacadeOnSensorStateChanged(object sender, SensorStateEventArgs sensorStateEventArgs)
        {
            if (sensorStateEventArgs.SensorState == ConnectionState.LinkDown)
            {
                PositionUpdateArgs = null;
                SatelliteSummaryUpdateArgs = null;
                PositionUpdateHandler?.Invoke(this, PositionUpdateArgs);
                SatelliteSummaryUpdateHandler?.Invoke(this,SatelliteSummaryUpdateArgs);
                TriggerSensorStatusHandler(DriverReturnCode.ErrorNotConnected,"Link Down");
            }
            _positionUpdates.Add(CreatePositionLog($"Sensor:{sensorStateEventArgs.SensorState}"));
        }

        private void CatalystFacadeOnSubscriptionHasExpired(object sender, EventArgs eventArgs)
        {
            TriggerLicenseStatusHandler(DriverReturnCode.ErrorNoLicense, "Subscription has expired");
        }

        private void CatalystFacadeOnUsbConnectionErrorOccured(object sender, EventArgs eventArgs)
        {
            TriggerSensorStatusHandler(DriverReturnCode.Error, "Usb Connection Error Occured");
        }
        private void CatalystFacadeOnSensorIsOutsideGeofence(object sender, EventArgs eventArgs)
        {
            TriggerSurveyStatusHandler(DriverReturnCode.Error, "Sensor is outside geofence");
        }

        private void CatalystFacadeOnRtkConnectionStatusUpdate(object sender, RtkConnectionStatusArgs rtkConnectionStatusArgs)
        {
            TriggerRtkConnectionStatusHandler(rtkConnectionStatusArgs.RtkConnectionStatus.ToString());
        }

        


        internal void BeginDisconnect()
        {
            RunOnThread(Disconnect);
        }

        private void Disconnect()
        {
            ProgressMsg = "Disconnecting";
            _catalystFacade.PositionUpdate -= CatalystFacadeOnPositionUpdate;
            _catalystFacade.UsbConnectionErrorOccured -= CatalystFacadeOnUsbConnectionErrorOccured;
            _catalystFacade.SubscriptionHasExpired -= CatalystFacadeOnSubscriptionHasExpired;
            _catalystFacade.SensorIsOutsideGeofence -= CatalystFacadeOnSensorIsOutsideGeofence;
            var retCode = _catalystFacade.DisconnectFromSensor();
            if (retCode == DriverReturnCode.Success)
            {
                PositionUpdateArgs = null;
                SatelliteSummaryUpdateArgs = null;
                PositionUpdateHandler?.Invoke(this, PositionUpdateArgs);
                SatelliteSummaryUpdateHandler?.Invoke(this,SatelliteSummaryUpdateArgs);
            }
            TriggerSensorStatusHandler(retCode, retCode == DriverReturnCode.Success ? "Disconnected" : "Unable to disconnect");
            ProgressMsg = null;

            if (retCode == DriverReturnCode.Success)
            {
                TriggerSurveyTypeHandler();
                TriggerRtkConnectionStatusHandler();
                TriggerSurveyStatusHandler();
                TriggerSurveyStatusHandler();
            }
        }
        private static double RadToDeg(double rad)
        {
            return rad * 180 / Math.PI;
        }

        private void CatalystFacadeOnPositionUpdate(object sender, PositionUpdateArgs positionUpdateArgs)
        {
            PositionUpdateArgs = positionUpdateArgs;
            _positionUpdates.Add(CreatePositionLog(
                $"{positionUpdateArgs.GpsTime:yyyy-MM-dd HH:mm:ss},{_pointName ?? "Roving"},{positionUpdateArgs.Solution},{RadToDeg(positionUpdateArgs.Latitude).ToString("0.00000000",CultureInfo.InvariantCulture)}," +
                $"{RadToDeg(positionUpdateArgs.Longitude).ToString("0.00000000", CultureInfo.InvariantCulture)},{positionUpdateArgs.Height.ToString("0.0000", CultureInfo.InvariantCulture)},{positionUpdateArgs.GroundPositionType},{positionUpdateArgs.HorizontalPrecision.ToString("0.000", CultureInfo.InvariantCulture)}," +
                $"{positionUpdateArgs.VerticalPrecision.ToString("0.000", CultureInfo.InvariantCulture)},{positionUpdateArgs.SigmaSemiMajorAxis.ToString("0.000", CultureInfo.InvariantCulture)},{positionUpdateArgs.SigmaSemiMinorAxis.ToString("0.000", CultureInfo.InvariantCulture)}," +
                $"{RadToDeg(positionUpdateArgs.SigmaOrientation).ToString("0.00000000", CultureInfo.InvariantCulture)},{positionUpdateArgs.InertialMeasurementUnitState.ToString()},{RadToDeg(positionUpdateArgs.Pitch).ToString("0.00000000", CultureInfo.InvariantCulture)}," +
                $"{RadToDeg(positionUpdateArgs.Roll).ToString("0.00000000", CultureInfo.InvariantCulture)},{RadToDeg(positionUpdateArgs.Yaw).ToString("0.00000000", CultureInfo.InvariantCulture)}," +
                $"{RadToDeg(positionUpdateArgs.PitchPrecision).ToString("0.00000000", CultureInfo.InvariantCulture)},{RadToDeg(positionUpdateArgs.RollPrecision).ToString("0.00000000", CultureInfo.InvariantCulture)}," +
                $"{RadToDeg(positionUpdateArgs.YawPrecision).ToString("0.00000000", CultureInfo.InvariantCulture)},{positionUpdateArgs.NumberSatellites},{positionUpdateArgs.NumberTrackedSatellites},{positionUpdateArgs.StaticEpochs},{positionUpdateArgs.CorrectionAge}," +
                $"{positionUpdateArgs.ReceivedCorrectionData},{(positionUpdateArgs.DatumTransformationApplied ? "Yes" : "No")},{GetReferenceFrameName(positionUpdateArgs.ReferenceFrame)}," +
                $"{GetReferenceFrameEpoch(positionUpdateArgs.ReferenceFrame)},{positionUpdateArgs.Elevation.ToString("0.0000", CultureInfo.InvariantCulture)}"));
            PositionUpdateHandler?.Invoke(this, positionUpdateArgs);
        }


        internal static String GetReferenceFrameName(IReferenceSystem referenceSystem)
        {
            return referenceSystem == null ? "Off" : referenceSystem.Name;
        }

        internal static double GetReferenceFrameEpoch(IReferenceSystem referenceSystem)
        {
            double ret = referenceSystem != null ? referenceSystem.Epoch : double.NaN;
            ret = ((double)Math.Round(ret * 10)) / 10;
            return ret;
        }
        public void MarksPoints(string pointName)
        {
            _positionUpdates.Add(CreatePositionLog($"Start Position Marking:{pointName}"));
            _pointName = pointName;
        }

        public void ClearMarking()
        {
            _positionUpdates.Add(CreatePositionLog($"End Position Marking:{_pointName}"));
            _pointName = null;
        }
        private static string CreatePositionLog(string msg)
        {

            return $"{DateTime.Now:yyyy-MM-dd HH:mm:ss},{msg}";
        }

        public void GoStatic(bool bIsGoStatic)
        {
            var retCode = _catalystFacade.SetMotionState(bIsGoStatic);
            if (DriverReturnCode.Success != retCode)
            {
                TriggerSensorStatusHandler(retCode, "Error when changing the GoStatic");
            }
            else
            {
                if (_bIsGoStatic == bIsGoStatic) return;
                _bIsGoStatic = bIsGoStatic;

                _positionUpdates.Add(CreatePositionLog(bIsGoStatic ? $"Start static mode" : $"Stop static mode"));
            }
        }

        private void TriggerSensorStatusHandler(DriverReturnCode retCode, string status = null)
        {
            SensorStatusUpdateArgs = new StatusUpdateArgs(retCode, status);
            SensorStatusHandler?.Invoke(this, SensorStatusUpdateArgs);
            FacadeLogger.Instance.LogMessage($"SensorStatus: {status}, retcode {retCode}");
        }

        private void TriggerSensorStatusHandler()
        {
            SensorStatusUpdateArgs = null;
            SensorStatusHandler?.Invoke(this, SensorStatusUpdateArgs);
        }

        internal void BeginGetNtripSource(Action onCompleted)
        {
            RunOnThread(GetNtripSource);
        }

        private void GetNtripSource()
        {
            var config = ReadConfig();
            if (!IsValidNtripServerConfig(config))
            {
                TriggerSurveyStatusHandler(DriverReturnCode.Error, "Unable to Fetch Ntrip Source (configuration error)");
                return;
            }
            ProgressMsg = "Getting Ntrip Source list";
            IEnumerable<string[]> sourceTable = null;

            var retCode = DriverReturnCode.ErrorGetSourceTable;

            try
            {
                retCode = _catalystFacade.GetNtripSourceTable(config.GetProperty(NtripServer),
                    int.Parse(config.GetProperty(NtripPort)), out sourceTable, config.GetProperty(NtripUser), config.GetProperty(NtripPassword));
            }
            catch (Exception)
            {
            }

            if (retCode == DriverReturnCode.Success)
            {
                if (sourceTable != null)
                {
                    if (File.Exists(MountPointCachePath))
                    {
                        File.Delete(MountPointCachePath);
                    }
                    using (var writer = new StreamWriter(File.OpenWrite(MountPointCachePath)))
                    {
                        foreach (var source in sourceTable)
                        {
                            foreach (string field in source)
                            {
                                writer.Write($"{field};");
                            }
                            writer.WriteLine();
                        }
                        writer.Close();
                    }
                }
            }
            TriggerSurveyStatusHandler(retCode,
                retCode == DriverReturnCode.Success ? "Fetched Ntrip Source" : "Unable to fetch Ntrip Source");
            ProgressMsg = null;
        }

        internal void BeginStartSurvey()
        {
            RunOnThread(StartSurvey);
        }

        private void StartSurvey()
        {
            ProgressMsg = "Starting Survey";
            var surveyType = SurveyTypes.TrimbleCorrectionHub;
            var targetReferenceFrame = CatalystFacade.TargetReferenceFrame.Off;
            var targetReferenceFrameId = 0;
            var geoidGridFileFullPath = string.Empty;
            var config = ReadConfig();
            if (config != null)
            {
                var surveyTypeValue = config.GetProperty(SurveyType);
                if (surveyTypeValue != null)
                    surveyType = (SurveyTypes) Enum.Parse(typeof(SurveyTypes), surveyTypeValue);

                var targetReferenceFrameValue = config.GetProperty(TargetReferenceFrame);
                if (targetReferenceFrameValue != null)
                    targetReferenceFrame = (TargetReferenceFrame)Enum.Parse(typeof(TargetReferenceFrame), targetReferenceFrameValue);

                var targetReferenceFrameIdValue = config.GetProperty(TargetReferenceFrameId);
                if (!string.IsNullOrEmpty(targetReferenceFrameIdValue))
                    targetReferenceFrameId = int.Parse(targetReferenceFrameIdValue);

                geoidGridFileFullPath = config.GetProperty(GeoidGridFileFullPath);
            }
            DriverReturnCode retCode = DriverReturnCode.Error;

            switch (surveyType)
            {
                case SurveyTypes.TrimbleCorrectionHub:
                    retCode = UsedSubscriptionType == SubscriptionTypes.User ? 
                        _catalystFacade.StartTrimbleCorrectionHubSurvey() :
                        _catalystFacade.StartTrimbleCorrectionHubSurvey(targetReferenceFrame, targetReferenceFrameId, geoidGridFileFullPath);
                    break;
                case SurveyTypes.RtxViaInternet:
                    retCode = UsedSubscriptionType == SubscriptionTypes.User ?
                        _catalystFacade.StartRtxViaInternet() :
                        _catalystFacade.StartRtxViaInternet(targetReferenceFrame, targetReferenceFrameId, geoidGridFileFullPath);
                    break;
                case SurveyTypes.RtxViaSatellite:
                    retCode = UsedSubscriptionType == SubscriptionTypes.User ?
                        _catalystFacade.StartRtxViaSatellite() :
                        _catalystFacade.StartRtxViaSatellite(targetReferenceFrame, targetReferenceFrameId, geoidGridFileFullPath);
                    break;
                case SurveyTypes.RtkViaNtrip:
                    if (config != null)
                    {
                        if (!IsValidNtripServerConfig(config) || !IsNtripUserConfig(config) || !IsMountPointConfig(config))
                        {
                            TriggerSurveyStatusHandler(DriverReturnCode.Error, "Unable to Start Survey (configuration error)");
                            ProgressMsg = null;
                            return;
                        }

                        string sourceEntry = config.GetProperty(NtripSource);
                        var mountPoint = sourceEntry;

                        // without STR
                        var sourceEntryParts = sourceEntry.Split(';');
                        int count = sourceEntryParts.Count();
                        if (count > 0)
                        {
                            mountPoint = sourceEntryParts[0];
                        }

                        retCode = UsedSubscriptionType == SubscriptionTypes.User ?
                            _catalystFacade.StartRTKViaNtrip(config.GetProperty(NtripServer),
                            int.Parse(config.GetProperty(NtripPort)), config.GetProperty(NtripUser),
                            config.GetProperty(NtripPassword), mountPoint) :
                            _catalystFacade.StartRTKViaNtrip(config.GetProperty(NtripServer),
                            int.Parse(config.GetProperty(NtripPort)), config.GetProperty(NtripUser),
                            config.GetProperty(NtripPassword), mountPoint, targetReferenceFrame, geoidGridFileFullPath);
                    }
                    else
                    {
                        TriggerSurveyStatusHandler(retCode, "Unable to Start Survey (no configuration)");
                        ProgressMsg = null;
                        return;
                    }
                    break;
                default:
                    TriggerSurveyStatusHandler(retCode, "Unable to Start Survey (unknown survey type)");
                    ProgressMsg = null;
                    return;
            }
            TriggerSurveyStatusHandler(retCode,
                retCode == DriverReturnCode.Success ? "Survey Started" : "Unable to Start Survey");
            ProgressMsg = null;
        }

        internal void BeginEndSurvey()
        {
            RunOnThread(EndSurvey);
        }

        private void EndSurvey()
        {
            ProgressMsg = "Ending Survey";
            var retCode = _catalystFacade.EndSurvey();
            TriggerSurveyStatusHandler(retCode, retCode == DriverReturnCode.Success ? "Survey Ended" : "Unable to End Survey");
            RtkConnectionStatusUpdateArgs = null;
            TriggerRtkConnectionStatusHandler(null);
            ProgressMsg = null;
        }

        private void TriggerSurveyStatusHandler(DriverReturnCode retCode, string status = null)
        {
            SurveyStatusUpdateArgs = new StatusUpdateArgs(retCode, status);
            SurveyStatusHandler?.Invoke(this, SurveyStatusUpdateArgs);
            FacadeLogger.Instance.LogMessage($"Surveystatus: {retCode}, {status}");
        }

        private void TriggerSurveyTypeHandler(DriverReturnCode retCode, string surveyType)
        {
            SurveyTypeUpdateArgs  = new StatusUpdateArgs(retCode,surveyType);
            SurveyTypeHandler?.Invoke(this, SurveyTypeUpdateArgs);
            FacadeLogger.Instance.LogMessage($"SurveyType: {retCode}, {surveyType}");
        }

        private void TriggerRtkConnectionStatusHandler(string status)
        {
            RtkConnectionStatusUpdateArgs = new StatusUpdateArgs(DriverReturnCode.Success, status);
            RtkConnectionStatusHandler?.Invoke(this, RtkConnectionStatusUpdateArgs);
            FacadeLogger.Instance.LogMessage($"RtkConnectionStatus: {status}");
        }

        private void TriggerSurveyStatusHandler()
        {
            SurveyStatusUpdateArgs = null;
            SurveyStatusHandler?.Invoke(this, SurveyStatusUpdateArgs);
        }

        private void TriggerSurveyTypeHandler()
        {
            SurveyTypeUpdateArgs = null;
            SurveyTypeHandler?.Invoke(this, SurveyTypeUpdateArgs);
        }

        private void TriggerRtkConnectionStatusHandler()
        {
            RtkConnectionStatusUpdateArgs = null;
            RtkConnectionStatusHandler?.Invoke(this, RtkConnectionStatusUpdateArgs);
        }

        public void SetSurveyStatusErrorMessage(string errorMessage)
        {
            RtkConnectionStatusUpdateArgs = new StatusUpdateArgs(DriverReturnCode.Error, errorMessage);
            RtkConnectionStatusHandler?.Invoke(this, RtkConnectionStatusUpdateArgs);
        }

        internal Properties ReadConfig()
        {
            ProgressMsg = "Reading Configuration";
            if (!File.Exists(ConfigFilePath))
            {
                CreateDefaultConfig();
            }
            if (!File.Exists(ConfigFilePath))
            {
                ProgressMsg = null;
                return null;
            }
            Properties properties;
            using (var fileStream = File.OpenRead(ConfigFilePath))
            {
                properties = new Properties();
                properties.Load(fileStream);
            }
            ProgressMsg = null;
            return properties;
        }

        internal void CreateDefaultConfig()
        {
            var properties = new Properties();
            properties.SetProperty(SubscriptionType, SubscriptionTypes.User.ToString());
            properties.SetProperty(DriverType, CatalystFacade.DriverType.TrimbleGNSS.ToString());
            properties.SetProperty(ConnectionType, ConnectionTypes.Bluetooth.ToString());
            properties.SetProperty(DeviceAddress, "");
            properties.SetProperty(DeviceName, "");
            properties.SetProperty(DevicePortNo, "");
            properties.SetProperty(NtripServer, "");
            properties.SetProperty(NtripPort, "");
            properties.SetProperty(NtripUser, "");
            properties.SetProperty(NtripPassword, "");
            properties.SetProperty(NtripSource, "");
            properties.SetProperty(SurveyType, SurveyTypes.TrimbleCorrectionHub.ToString());
            properties.SetProperty(TargetReferenceFrame, CatalystFacade.TargetReferenceFrame.Off.ToString());
            properties.SetProperty(TargetReferenceFrameId, "0");

            using (var fileStream = File.OpenWrite(ConfigFilePath))
            {
                properties.Store(fileStream, "Configuration CatalystFacade");
                fileStream.Close();
            }
        }

        internal void BeginReadConfig(Action<Java.Util.Properties> onCompleted)
        {
            RunOnThread(() =>
            {
                var config = ReadConfig();
                onCompleted(config);
            });
        }


        private static bool IsValidNtripServerConfig(Properties properties)
        {
            try
            {

                if (string.IsNullOrEmpty(properties.GetProperty(NtripServer)))
                {
                    return false;
                }
                if (string.IsNullOrEmpty(properties.GetProperty(NtripPort)))
                {
                    return false;
                }

                var i = int.Parse(properties.GetProperty(NtripPort));
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
        private static bool IsNtripUserConfig(Properties properties)
        {
            try
            {
                if (string.IsNullOrEmpty(properties.GetProperty(NtripUser)))
                {
                    return false;
                }
                if (string.IsNullOrEmpty(properties.GetProperty(NtripPassword)))
                { 
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }

        private static bool IsMountPointConfig(Properties properties)
        {
            try
            {
                if (string.IsNullOrEmpty(properties.GetProperty(NtripSource)))
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
        internal string[] ReadMountPointCache()
        {
            if (!File.Exists(MountPointCachePath))
            {
                return null;
            }
            ProgressMsg = "Reading NTRIP Source list cache";
            var readMountPointCache = File.ReadAllLines(MountPointCachePath);
            ProgressMsg = null;
            return readMountPointCache;
        }

        internal void BeginReadMountPointCache(Action<string[]> onCompleted)
        {
            RunOnThread(() =>
            {
                var source = ReadMountPointCache();
                onCompleted(source);
            });
        }

        internal void BeginWriteConfig(Java.Util.Properties properties)
        {
            RunOnThread(() => WriteConfig(properties));
        }

        private void WriteConfig(Java.Util.Properties properties)
        {
            var oldDriverType = ReadDriverTypeFromConfig();

            ProgressMsg = "Saving Configuration";

            WriteConfigToFile(properties);

            if (bool.Parse(properties.GetProperty(EnableDriverLogs)))
            {
                if (!Directory.Exists(_catalystFacade.DriverLogPath))
                {
                    Directory.CreateDirectory(_catalystFacade.DriverLogPath);
                }
            }
            else
            {
                if (Directory.Exists(_catalystFacade.DriverLogPath))
                {
                    Directory.Delete(_catalystFacade.DriverLogPath, true);
                }
            }

            var subscriptionTypeStr = properties.GetProperty(SubscriptionType);
            if (UsedSubscriptionType != (SubscriptionTypes)Enum.Parse(typeof(SubscriptionTypes), subscriptionTypeStr, true))
            {
                ReInit();
            }

            if (_licReady)
            {
                var deviceTypeStr = properties.GetProperty(DriverType);
                var driverType = (DriverType)Enum.Parse(typeof(DriverType), deviceTypeStr, true);

                if (driverType != oldDriverType)
                {
                    Disconnect();
                    _catalystFacade.ReleaseDriver();
                    var retCode = _catalystFacade.InitDriver(driverType);
                    TriggerSensorStatusHandler(retCode,
                        retCode == DriverReturnCode.Success ? $"{deviceTypeStr} driver loaded" : $"Unable to load {deviceTypeStr} driver");
                }
            }
            ProgressMsg = null;
        }

        private void WriteConfigToFile(Java.Util.Properties properties)
        {
            if (File.Exists(ConfigFilePath))
            {
                File.Delete(ConfigFilePath);
            }
            using (var fileStream = File.OpenWrite(ConfigFilePath))
            {
                properties.Store(fileStream, "Configuration CatalystFacade");
                fileStream.Close();
            }
            SetReducedAntennaHeight();
        }

        public void BeginDeleteConfig()
        {
            RunOnThread(DeleteConfig);
        }

        private void DeleteConfig()
        {
            ProgressMsg = "Deleting Configuration";
            if (File.Exists(ConfigFilePath))
            {
                File.Delete(ConfigFilePath);
            }
            if (File.Exists(MountPointCachePath))
            {
                File.Delete(MountPointCachePath);
            }
            ProgressMsg = null;
        }

        private void RunOnThread(Action method,bool newThread=false)
        {
            if (!newThread)
            {
                ThreadPool.QueueUserWorkItem(state => method());
            }
            else
            {
                new Thread(() => method()).Start();
            }
        }

        public void ReceivedPermissions()
        {
            _waitForPermissions.Set();
        }

        public int GetExternalReceiverBatteryLevel()
        {
            return _catalystFacade?.GetExternalReceiverBatteryLevel() ?? 0;
        }

        public void Maillog()
        {
            try
            {
                var result = SendEmail("TPSDK facade positionlog", "Please find attached the log file.",PositionLogPath).Result;
                if (!result)
                {
                    Toast.MakeText(_applicationContext, "Email preparation failed", ToastLength.Long).Show();
                }
            }
            catch (System.Exception e)
            {
                Toast.MakeText(_applicationContext, $"Error: {e}", ToastLength.Long).Show();
            }
        }

        public async Task<bool> SendEmail(string subject, string body,string attachmentPath)
        {
            try
            {
                var message = new EmailMessage
                {
                    Subject = subject,
                    Body = body
                };
                message.Attachments.Add(new EmailAttachment(attachmentPath));
                await Email.ComposeAsync(message);
                return true;
            }catch (Exception e)
            {
                Toast.MakeText(_applicationContext, $"Error: {e}", ToastLength.Long).Show();
            }

            return false;
        }

        public void OpenFacadeLog()
        {
            try
            {
                var contentUri = Xamarin.Essentials.FileProvider.GetUriForFile(_applicationContext, _applicationContext.PackageName + ".provider", new Java.IO.File(FacadeLogger.Instance.Filename));

                Intent intent = new Intent(Intent.ActionView);
                intent.SetDataAndType(contentUri, "text/html");
                intent.SetFlags(ActivityFlags.GrantReadUriPermission);
                intent.SetFlags(ActivityFlags.NewTask);

                _applicationContext.GrantUriPermission("com.lonelycatgames.Xplore", contentUri, ActivityFlags.GrantReadUriPermission);

                _applicationContext.StartActivity(intent);
            }
            catch (System.Exception e)
            {
                Toast.MakeText(_applicationContext, $"Error: {e}", ToastLength.Long).Show();
            }
        }

        private string GetDeviceLicense()
        {
            try
            {
                string result = "";
                MainThread.InvokeOnMainThreadAsync(async () => {
                    var pickerResult = await FilePicker.PickAsync(PickOptions.Default);
                    if (pickerResult != null)
                    {
                        using (var stream = pickerResult.OpenReadAsync().Result)
                        using(var reader = new StreamReader(stream))
                        {
                            result = reader.ReadToEnd();
                        }
                    }
                }).Wait();
                return result;
            }
            catch (System.Exception e)
            {
                Toast.MakeText(_applicationContext, $"Error: {e}", ToastLength.Long).Show();
                return "";
            }
        }

        public int Compress(ParcelFileDescriptor pfd)
        {
            if (pfd == null)
            {
                return 0;
            }

            try
            {
                var zipFile = new FileInfo(Path.Combine(_catalystFacade.DriverLogPath, "temp.zip"));

                if (zipFile.Exists)
                {
                    zipFile.Delete();
                }

                var dest = File.Create(zipFile.FullName, BUFFER);

                DirectoryInfo directorySelected = new DirectoryInfo(_catalystFacade.DriverLogPath);
                var fileInfos = directorySelected.GetFiles();

                using (var @out = new ZipOutputStream(dest))
                {
                    var data = new byte[BUFFER];

                    foreach (var F in fileInfos)
                    {
                        if (!F.Exists || F.Name == zipFile.Name) continue;

                        var length = F.Length;

                        using (var @fi = File.OpenRead(F.FullName))
                        {
                            var entry = new ZipEntry(F.Name);
                            @out.PutNextEntry(entry);
                            int count;
                            while ((count = @fi.Read(data, 0, BUFFER)) != -1)
                            {
                                @out.Write(data, 0, count);
                                if ((length -= count) <= 0) break;
                            }
                            @fi.Close();
                        }
                    }

                    @out.Close();
                }

                zipFile = new FileInfo(Path.Combine(_catalystFacade.DriverLogPath, "temp.zip"));
                if (!zipFile.Exists)
                {
                    Log.Error("CatalystFacadeDemo", "Export Logs failed");
                    return 0;
                }

                using (var @out = new FileOutputStream(pfd.FileDescriptor))
                {
                    var zipBytes = new byte[2048];
                    var zipFileLength = zipFile.Length;
                    using (var fi = File.OpenRead(zipFile.FullName))
                    {
                        int count;
                        while ((count = fi.Read(zipBytes, 0, 2048)) != -1)
                        {
                            @out.Write(zipBytes);
                            if ((zipFileLength -= count) <= 0) break;
                        }

                        fi.Close();
                    }
                    @out.Close();
                }
                zipFile.Delete();
                
                return fileInfos.Length;
            }
            catch (Exception e)
            {
                Log.Error("CatalystFacadeDemo", "Export Logs failed:" + e.Message);
                return 0;
            }

        }
    }
}