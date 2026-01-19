using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading;
using System.Threading.Tasks;
using Android.Content;
using Trimble.Licensing;
using Trimble.Ssi;
using Trimble.Ssi.Connection;
using Trimble.Ssi.DriverManagement;
using Android.Bluetooth;
using Trimble.Ssi.DriverCommon.Core.Android;

namespace CatalystFacade.Droid
{
    public class CatalystFacade : global::CatalystFacade.CatalystFacade
    {
        private const string Catalystfacade = "CatalystFacade";
        private readonly string _appGuid;
        private DriverManager _driverManager;

        /// <summary>
        /// Catalyst facade constructor
        /// </summary>
        /// <param name="appGuid">Your application guid as received by Trimble. Part of the contract workflow.</param>
        /// <param name="context">Your application context.</param>
        public CatalystFacade(string appGuid, Context context)
        {
            _appGuid = appGuid;
            var driverLogFilePath = Path.Combine(context.GetExternalFilesDir(null).AbsolutePath, "log");
            DriverManager.DriverLogFilePath = driverLogFilePath;


            _driverManager = new DriverManager(LicensingMode.V2, _appGuid, context);
            Context = context;

            NativeDependencyLoader.Instance.LibDir = Context.ApplicationInfo.NativeLibraryDir;
        }

        /// <summary>
        /// Returns Log file path for drivers
        /// </summary>
        public string DriverLogPath => DriverManager.DriverLogFilePath;

        public Context Context { get; }


        /// <summary>
        /// Version of the SDK
        /// </summary>
        /// <returns></returns>
        public override string Version()
        {
            return DriverVersion.SdkVersion;
        }


        /// <summary>
        /// Device identifier
        /// </summary>
        /// <returns></returns>
        public override string HostSerial()
        {
            return _driverManager.GetHostSerial();
        }


        /// <summary>
        /// Load the subscription without Trimble Mobile Manager
        /// </summary>
        /// <returns></returns>
        public DriverReturnCode LoadSubscription()
        {
            //Releases any already loaded driver
            ReleaseDriver();
            _driverManager.SetTrimbleUser(null);
            TrimbleIdLoginSuccessful = false;
            return DriverReturnCode.Success;
        }

        /// <summary>
        /// Load the subscription exposed from Trimble Mobile Manager
        /// </summary>
        /// <param name="userTrimbleId">The user ID GUID as received via the intent service from TMM. Please check the corresponding chapter on this for details. </param>
        /// <returns></returns>
        public DriverReturnCode LoadSubscriptionFromTrimbleMobileManager(string userTrimbleId)
        {
            //Releases any already loaded driver
            ReleaseDriver();
            ITMMLicenseServiceConnector serviceConnector = TMMLicenseServiceConnectorInstanceFactory.Instance(Context);
            var tcs = new TaskCompletionSource<DriverReturnCode>();
            var thread = new Thread(() =>
            {
                try
                {
                    _driverManager = new DriverManager(LicensingMode.V2, _appGuid, Context);
                    serviceConnector.DownloadLicense(_appGuid, userTrimbleId);
                    _driverManager.SetTrimbleUser(userTrimbleId);
                    tcs.SetResult(DriverReturnCode.Success);
                }
                catch (Trimble.Licensing.V2.LicenseException e)
                {
                    LogException("License", e);
                    _driverManager.SetTrimbleUser(null);
                    tcs.SetResult(DriverReturnCode.ErrorNoLicense);
                }
                catch (Trimble.Ssi.LicenseException e)
                {
                    LogException("License", e);
                    _driverManager.SetTrimbleUser(null);
                    tcs.SetResult(DriverReturnCode.ErrorNoLicense);
                }
            });
            thread.Start();
            var driverReturnCode = tcs.Task.Result;
            TrimbleIdLoginSuccessful = driverReturnCode == DriverReturnCode.Success;
            return driverReturnCode;
        }

        /// <summary>
        /// Load and push a device subscription to the device and get license information
        /// </summary>
        /// <param name="deviceLicense">The device license content as string</param>
        /// <param name="subscriptionName">The subscription name</param>
        /// <param name="issueDate">The license issue date</param>
        /// <param name="expiryDate">The Catalyst license expiry date</param>
        /// <returns></returns>
        public DriverReturnCode LoadDeviceSubscription(string deviceLicense, out string subscriptionName, out DateTime issueDate, out DateTime expiryDate)
        {
            //Releases any already loaded driver
            ReleaseDriver();

            TrimbleIdLoginSuccessful = false;
            DriverReturnCode rc = DriverReturnCode.Success;

            subscriptionName = "";
            issueDate = DateTime.MinValue;
            expiryDate = DateTime.MinValue;

            try
            {
                var license = LicensingFactory.CreateV2Licensing();
                var appid = license.installDevicelicense(deviceLicense);
                _driverManager = new DriverManager(LicensingMode.V2Legacy, appid, Context);
                _driverManager.SetTrimbleUser(appid);

                // Read license data
                var user = license.Login(appid);
                var licenseGroup = license.GetLicenseGroup(user, appid);

                issueDate = DateTime.Parse(licenseGroup.Issued + "Z"); 

                var licenses = licenseGroup.Licenses.Where(x => x.GetLicenseFeature("Receiver.Catalyst") != null).ToArray();
                var licenseInfo = licenses.FirstOrDefault();
                if( licenseInfo != null)
                {
                    subscriptionName = licenseInfo.Name;
                    expiryDate = DateTime.Parse(licenseInfo.UTCExpiryDateTime + "Z");
                }
            }
            catch (Trimble.Licensing.V2.LicenseException e)
            {
                LogException("License", e);
                _driverManager.SetTrimbleUser(null);
                rc = DriverReturnCode.ErrorNoLicense;
            }
            catch (Trimble.Ssi.LicenseException e)
            {
                LogException("License", e);
                _driverManager.SetTrimbleUser(null);
                rc = DriverReturnCode.ErrorNoLicense;
            }
            catch (Exception e)
            {
                LogException("License", e);
                _driverManager.SetTrimbleUser(null);
                rc = DriverReturnCode.ErrorNoLicense;
            }

            return rc;
        }

        /// <summary>
        /// Gets the driver.
        /// </summary>
        /// <param name="driverType"></param>
        /// <returns></returns>
        /// <exception cref="System.ArgumentOutOfRangeException">deviceType - null</exception>
        protected override IDriver GetDriver(DriverType driverType)
        {
            var driverAssembly = Assembly.Load(GetDriverAssemblyName(driverType));

            IDriver driver = null;

            driver = _driverManager.CreateDriver(_driverManager.RegisterDriverAssembly(driverAssembly).Single());

            return driver;
        }

        private string GetDriverAssemblyName(DriverType driverType)
        {
#if NET
            switch (driverType)
            {
                case DriverType.Catalyst:
                    return "Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android";
                case DriverType.TrimbleGNSS:
                case DriverType.EM100:
                    return "Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.NET";
                case DriverType.Mock:
                    return "Trimble.Ssi.Driver.MockGnss.NET";
                case DriverType.SpectraPrecision:
                case DriverType.TDC150:
                    return "Trimble.Ssi.Driver.CarpoBased.Driver.SP80.NET";
            }
#else
            switch (driverType)
            {
                case DriverType.Catalyst:
                    return "Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.Android";
                case DriverType.TrimbleGNSS:
                case DriverType.EM100:
                    return "Trimble.Ssi.Driver.CarpoBased.Driver.RSeries.Android";
                case DriverType.Mock:
                    return "Trimble.Ssi.Driver.MockGnss.Android";
                case DriverType.SpectraPrecision:
                case DriverType.TDC150:
                    return "Trimble.Ssi.Driver.CarpoBased.Driver.SP80.Android";
            }
#endif
            return "";
        }

        /// <summary>
        /// Connect to the sensor. To monitor the process subscribe to the <see cref="SensorStateChanged"/> before calling Connect().  
        /// </summary>
        /// <returns></returns>
        public DriverReturnCode Connect()
        {
            switch (CurrentDriverType)
            {
                case DriverType.Catalyst:
                    return ConnectToSensor(ConnectionType.AndroidService, new Dictionary<string, object> { { "context", Context }, { "packagename", Context.PackageName } });
                case DriverType.EM100:
                    ICommunicator emPowerTcpCommunicator = new EMPowerTCPCommunicator(this);
                    return ConnectToSensor(ConnectionType.ExternalEMPower,
                        new Dictionary<string, object> {{"communicator", emPowerTcpCommunicator } });
                case DriverType.TDC150:
                    ICommunicator onboardSerialCommunicator = new OnboardSerialCommunicator(this);
                    return ConnectToSensor(ConnectionType.ExternalOnboardSerial,
                        new Dictionary<string, object> { { "communicator", onboardSerialCommunicator } });
                default:
                    return DriverReturnCode.ErrorFunctionNotSupported;
            }
            
        }

        /// <summary>
        /// Connect to the sensor via Bluetooth
        /// </summary>
        /// <param name="address">The bluetooth address in URI format, something like AA:BB:CC:12:23</param>
        /// <returns></returns>
        public DriverReturnCode ConnectViaBluetooth(string address)
        {
            if (DriverType.TrimbleGNSS != CurrentDriverType && DriverType.SpectraPrecision != CurrentDriverType)
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            if (string.IsNullOrEmpty(address))
                return DriverReturnCode.ErrorInvalidParameter;
            BluetoothDevice device;
            try
            {
                device = ((BluetoothManager)Context.GetSystemService(Context.BluetoothService))?.Adapter?.GetRemoteDevice(address);
            }
            catch (Exception)
            {
                return DriverReturnCode.ErrorInvalidParameter;
            }
            ICommunicator communicator = new BluetoothCommunicator(this, device);
            return ConnectToSensor(ConnectionType.ExternalBluetooth, new Dictionary<string, object> { { "communicator", communicator } });
        }

        /// <summary>
        /// Connect to sensor via Wifi
        /// </summary>
        /// <param name="tcpIpAddress">The ip of the receiver, something like 192.168.142.1/</param>
        /// <param name="tcpIpPort">The port, typically port 80</param>
        /// <returns></returns>
        public DriverReturnCode ConnectViaWifi(string tcpIpAddress, string tcpIpPort)
        {
            if (DriverType.TrimbleGNSS != CurrentDriverType)
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            if (string.IsNullOrEmpty(tcpIpAddress) || string.IsNullOrEmpty(tcpIpPort))
                return DriverReturnCode.ErrorInvalidParameter;

            try
            {
                ICommunicator communicator = new TCPCommunicator(tcpIpAddress, int.Parse(tcpIpPort), this, Context);
                return ConnectToSensor(ConnectionType.ExternalIP, new Dictionary<string, object> { { "communicator", communicator } });
            }
            catch (Exception)
            {
                return DriverReturnCode.ErrorInvalidParameter;
            }
        }

        public override void LogInfo(string tag, string message)
        {
            Android.Util.Log.Info(Catalystfacade, $"{tag}:{message}");
        }

        public override void LogDebug(string tag, string message)
        {
            Android.Util.Log.Debug(Catalystfacade, $"{tag}:{message}");
        }

        public override void LogException(string tag, Exception exception)
        {
            Android.Util.Log.Error(Catalystfacade,$"{tag}:{exception.Message}:{exception.StackTrace}");
        }

        public override void LogError(string tag, string message)
        {
            Android.Util.Log.Error(Catalystfacade, $"{tag}:{message}");
        }
    }
}
