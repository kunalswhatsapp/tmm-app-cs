using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Trimble.Ssi;
using Trimble.Ssi.Connection;
using Trimble.Ssi.Interfaces.OptionCode;
using Trimble.Ssi.Interfaces.Gnss;
using Trimble.Ssi.Interfaces.Gnss.Antenna;
using Trimble.Ssi.Interfaces.Gnss.InertialNavigation;
using Trimble.Ssi.Interfaces.Gnss.Positioning;
using Trimble.Ssi.Interfaces.Gnss.Rtk;
using Trimble.Ssi.Interfaces.Gnss.Satellites;
using Trimble.Ssi.Interfaces.Gnss.Subscriptions;
using Trimble.Ssi.Interfaces.Power;
using Trimble.Ssi.Interfaces.SensorProperties;
using Trimble.Ssi.Interfaces.Subscriptions;
using IBattery = Trimble.Ssi.Interfaces.Power.IBattery;

namespace CatalystFacade
{
    /// <summary>
    /// CatalystFacade is  a one layer interface to the Catalyst Antenna. It provides functions and event delegates to control the antenna
    /// and get antenna information.
    /// </summary>
    public abstract class CatalystFacade
    {
        private IDriver _driver;

        private ISensor _sensor;

        private ConnectionSettings _connectionSettings;

        private double _reducedAntennaHeight = 0.0;

        private long _receivedCorrectionData = 0;
        private int _referenceStationId = 0;

        private bool rtkCorrectionHubStarted;
        private Func<DriverReturnCode> restartRtkCorrectionHub;
        protected bool TrimbleIdLoginSuccessful { get;  set; }

        protected DriverType CurrentDriverType { get; private set; }

        ///  <summary>
        /// 	Creates an instance 
        ///  </summary>
        protected CatalystFacade()
        {
            _driver = null;
            _sensor = null;
            UsbConnectionErrorOccured = null;
            SensorStateChanged = null;
            SubscriptionHasExpired = null;
            SensorIsOutsideGeofence = null;
            SatelliteUpdate = null;
            PositionUpdate = null;
            RtkServiceAvailable = null;
            RtxServiceAvailable = null;
            RtkConnectionStatusUpdate = null;
            SurveyTypeUpdate = null;
            PowerSourceUpdate = null;
        }

        ///	<summary> 
        /// Interface version of the driver
        /// </summary>
        public abstract string Version();

        ///	<summary> 
        /// Serial number of the device
        /// </summary>
        public abstract string HostSerial();


        /// <summary>
        /// Inits the Facade interface layer with either a Catalyst type receiver or an traditional Trimble GNSS reciever
        /// </summary>
        /// <param name="driverType">The type of driver which will get loaded.</param>
        /// <exception cref="DriverReturnCode.DeviceTypeNotSupported">Thrown when an invalid/ not supported DriveType is provided.</exception>
        /// <exception cref="DriverReturnCode.ErrorLoadingDriver">Thrown when the driver could not get loaded.</exception>
        /// <returns></returns>
        public DriverReturnCode InitDriver(DriverType driverType)
        {
            try
            {
                if (_driver != null)
                {
                    ReleaseDriver();
                }

                CurrentDriverType = driverType;

                _driver = GetDriver(driverType);
                if (null == _driver)
                {
                    return DriverReturnCode.ErrorLoadingDriver;
                }
            }
            catch (ArgumentOutOfRangeException e)
            {
                LogException("LoadDriver", e);
                return DriverReturnCode.DeviceTypeNotSupported;
            }
            catch (Exception e)
            {
                LogException("LoadDriver", e);
                return DriverReturnCode.ErrorLoadingDriver;
            }
            return DriverReturnCode.Success;
        }



        /// <summary>
        /// Is sensor connected?
        /// </summary>
        /// <returns>True if sensor is conencted, otherwise false</returns>
        public bool IsSensorConnected()
        {
            return _sensor?.ConnectionState == ConnectionState.Connected;
        }


        protected abstract IDriver GetDriver(DriverType driverType);

        public abstract void LogException(string tag, Exception exception);

        public abstract void LogInfo(string tag, string message);

        public abstract void LogError(string tag, string message);

        public abstract void LogDebug(string tag, string message);


        /// <summary>
        /// Releases the driver.
        /// </summary>
        /// <returns>The driver return code <see cref="DriverReturnCode"/> </returns>
        public DriverReturnCode ReleaseDriver()
        {
            try
            {
                if (_driver == null)
                {
                    return DriverReturnCode.Error;
                }
                if (_sensor?.ConnectionState == ConnectionState.Connected)
                {
                    DisconnectFromSensor();
                }

                _driver = null;
            }
            catch (Exception e)
            {
                LogException("ReleaseDriver", e);
                return DriverReturnCode.Error;
            }
            return DriverReturnCode.Success;
        }

        /// <summary>
        /// Connect mock sensor.
        /// </summary>
        /// <returns>A full list of all available DriverReturnCodes can be found at <see cref="DriverReturnCode"/>.</returns>
        public DriverReturnCode ConnectMock()
        {
            return ConnectToSensor(ConnectionType.Internal, new Dictionary<string, object>());
        }

        /// <summary>
        /// Connect to the sensor
        /// </summary>
        /// <param name="connectionType">The connection type as used for traditional receivers</param>
        /// <param name="parameters">The parameters.</param>
        /// <returns>A full list of all available DriverReturnCodes can be found at <see cref="DriverReturnCode"/>.</returns>
        protected DriverReturnCode ConnectToSensor(ConnectionType connectionType, Dictionary<string, object> parameters = null)
        {
            var connectionParams = new List<IConnectionParameter>();
            try
            {
                if (_sensor != null)
                {
                    if (_sensor.ConnectionState == ConnectionState.Connected || _sensor.ConnectionState == ConnectionState.Connecting
                            || _sensor.ConnectionState == ConnectionState.Disconnecting)
                    {
                        return DriverReturnCode.ErrorAlreadyConnected;
                    }

                    if (_sensor.ConnectionState == ConnectionState.LinkDown)
                    {
                        DisconnectFromSensor();
                    }

                    _driver.RemoveSensor(_sensor);
                    _sensor = null;
                }

                _sensor = _driver.CreateSensor();

                if (connectionType == ConnectionType.AndroidService)
                {
                    var serviceSettings = (IConnectionParameterAndroidServiceSettings)_sensor.CreateConnectionParameter(ConnectionParameterType.AndroidServiceSettings);
                    if (parameters != null)
                    {
                        serviceSettings.Context = parameters["context"];
                        serviceSettings.PackageName = parameters["packagename"] as string;
                        connectionParams.Add(serviceSettings);
                    }
                    else
                    {
                        return DriverReturnCode.ErrorInvalidParameter;
                    }
                    _connectionSettings = new ConnectionSettings(ConnectionType.AndroidService, connectionParams);
                }
                else if (connectionType == ConnectionType.ExternalIP ||
                         connectionType == ConnectionType.ExternalBluetooth ||
                         connectionType == ConnectionType.ExternalOnboardSerial ||
                         connectionType == ConnectionType.ExternalEMPower)
                {
                    if (null == parameters)
                        return DriverReturnCode.ErrorInvalidParameter;

                    ConnectionParameterType connectionParameterType = ConnectionParameterType.IPSettings;
                    switch (connectionType)
                    {
                        case ConnectionType.ExternalIP:
                        case ConnectionType.ExternalEMPower:
                            connectionParameterType = ConnectionParameterType.IPSettings;
                            break;
                        case ConnectionType.ExternalBluetooth:
                            connectionParameterType = ConnectionParameterType.BluetoothSocketSettings;
                            break;
                        case ConnectionType.ExternalOnboardSerial:
                            connectionParameterType = ConnectionParameterType.SerialSettings;
                            break;
                    }

                    var settings =
                        (IConnectionParameterExternalSettings)_sensor.CreateConnectionParameter(
                            connectionParameterType);
                    settings.Communicator = parameters["communicator"] as ICommunicator;
                    connectionParams.Add(settings);
                    _connectionSettings = new ConnectionSettings(connectionType, connectionParams);
                }
                else if (connectionType == ConnectionType.Internal)
                {
                    _connectionSettings = new ConnectionSettings(ConnectionType.Internal);
                }

                SubscribeSensorEvents();

                _sensor.Connect(_connectionSettings);

                Subscribe();

                EnableSBASTracking();

                SetInertialNavigationMode(InertialNavigationMode.Off);
            }
            catch (Trimble.Ssi.OperationCanceledException e)
            {
                LogException("Connect", e);
                //Disconnect forcefully if the exception happened after successful connection
                if (IsSensorConnected())
                {
                    DisconnectFromSensor();
                }
                return DriverReturnCode.ErrorCancelledFromUser;
            }
            catch (Trimble.Ssi.Connection.SensorOccupiedException e)
            {
                LogException("Connect", e);
                //Disconnect forcefully if the exception happened after successful connection
                if (IsSensorConnected())
                {
                    DisconnectFromSensor();
                }
                return DriverReturnCode.ErrorSensorAlreadyInUse;
            }
            catch (Exception e)
            {
                LogException("Connect", e);
                //Disconnect forcefully if the exception happened after successful connection
                if (IsSensorConnected())
                {
                    DisconnectFromSensor();
                }
                return DriverReturnCode.ErrorNotConnected;
            }
            return DriverReturnCode.Success;
        }



        /// <summary>
        /// Reconnect with known (previously used) parameters.
        /// </summary>
        /// <exception cref="DriverReturnCode.ErrorCancelledFromUser">Thrown when the user canceled the reconnect manually.</exception>
        /// <exception cref="DriverReturnCode.ErrorAlreadyConnected">Thrown when the driver is already connected to the sensor.</exception>
        /// <exception cref="DriverReturnCode.ErrorNotConnected">Thrown when the driver still can't connect.</exception>
        /// <returns>The driver return code <see cref="DriverReturnCode"/> </returns>
        public DriverReturnCode ReConnectToSensor()
        {
            try
            {
                UnsubscribeSensorEvents();
                Unsubscribe();
                SubscribeSensorEvents();
                _sensor.Connect(_connectionSettings);
                Subscribe();
            }
            catch (Trimble.Ssi.OperationCanceledException e)
            {
                LogException("Reconnect", e);
                return DriverReturnCode.ErrorCancelledFromUser;
            }
            catch (AlreadyConnectedException e)
            {
                LogException("Reconnect", e);
                return DriverReturnCode.ErrorAlreadyConnected;
            }
            catch (Exception e)
            {
                LogException("Reconnect", e);
                return DriverReturnCode.ErrorNotConnected;
            }
            return DriverReturnCode.Success;
        }


        /// <summary>
        /// Disconnect
        /// </summary>
		/// <exception cref="DriverReturnCode.ErrorCancelledFromUser">Thrown when the user canceled the reconnect manually.</exception>
		/// <exception cref="DriverReturnCode.Error">Thrown when an unknown/ not mapped error occured.</exception>
        /// <returns>The driver return code <see cref="DriverReturnCode"/> </returns>
        public DriverReturnCode DisconnectFromSensor()
        {
            // ignore the error for Unsubscribe
            try
            {
                Unsubscribe();
            }
            catch (Exception e)
            {
                LogException("Unsubscribe", e);
            }

            try
            {
                if (_sensor != null)
                {
                    _sensor.Disconnect();
                    // ignore the error for Unsubscribe
                    try
                    {
                       UnsubscribeSensorEvents();
                    }
                    catch (Exception e)
                    {
                        LogException("Unsubscribe", e);
                    }
                    _driver.RemoveSensor(_sensor);
                    _sensor = null;
                }
            }
            catch (Trimble.Ssi.OperationCanceledException e)
            {
                LogException("Disconnect", e);
                return DriverReturnCode.ErrorCancelledFromUser;
            }
            catch (Exception e)
            {
                LogException("Disconnect", e);
                return DriverReturnCode.Error;
            }
            return DriverReturnCode.Success;
        }

        /// <summary>
        /// Subscribe to sensor events
        /// </summary>
        private void SubscribeSensorEvents()
        {
            if (_sensor == null) return;
            _sensor.ConnectionStateChanged += SensorOnConnectionStateChanged;
            _sensor.ErrorOccurred += SensorOnErrorOccurred;
        }

        /// <summary>
        /// Unsubscribe from sensor events
        /// </summary>
        private void UnsubscribeSensorEvents()
        {
            if (_sensor == null) return;
            _sensor.ConnectionStateChanged -= SensorOnConnectionStateChanged;
            _sensor.ErrorOccurred -= SensorOnErrorOccurred;
        }

        /// <summary>
        /// Subscribe to all important interface/feature events
        /// </summary>
        private void Subscribe()
        {
            if(_sensor == null) return;

            var ssiPositioning = _sensor.GetInterface<ISsiPositioning>();
            if (ssiPositioning != null)
            {
                ssiPositioning.NewPositioningObservations += OnNewPositioningObservations;
                ssiPositioning.StartPositioning(new PositioningSettings());
            }

            var ssiSatellites = _sensor.GetInterface<ISsiSatellites>();
            if (ssiSatellites != null)
            {
                ssiSatellites.SatellitesUpdate += OnSatellitesUpdate;
                ssiSatellites.StartSatelliteStreaming();
            }


            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();
            if (ssiRtkSurvey != null)
            {
                ssiRtkSurvey.DataReceived += OnDataReceived;
                ssiRtkSurvey.SurveyStateChanged += OnSurveyStateChanged;
                ssiRtkSurvey.ReferenceStationUpdated += OnReferenceStationUpdate;
            }

            var ssiPower = _sensor.GetInterface<ISsiPower>();
            if (ssiPower != null)
            {
                ssiPower.CurrentPowerSourceChanged += OnPowerUpdateChanged;
            }
        }


        private void OnSurveyStateChanged(object sender, SurveyStateChangedEventArgs e)
        {
            if (e.SurveyState == SurveyState.Running)
            {
                SurveyTypeUpdate?.Invoke(this, new SurveyTypeUpdateArgs(GetCurrentSurvey()));
            }

            else if (e.SurveyState == SurveyState.NotRunning)
            {
                SurveyTypeUpdate?.Invoke(this, new SurveyTypeUpdateArgs(SurveyType.None));
            }
        }

        /// <summary>
        /// Unsubscribe from all interface/feature events
        /// </summary>
        private void Unsubscribe()
        {
            if (_sensor == null) return;

            var ssiPositioning = _sensor.GetInterface<ISsiPositioning>();
            if (ssiPositioning != null)
            {
                ssiPositioning.NewPositioningObservations -= OnNewPositioningObservations;
                ssiPositioning.StopPositioning();
            }

            var ssiSatellites = _sensor.GetInterface<ISsiSatellites>();
            if (ssiSatellites != null)
            {
                ssiSatellites.SatellitesUpdate -= OnSatellitesUpdate;
                ssiSatellites.StopSatelliteStreaming();
            }

            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();
            if (ssiRtkSurvey != null)
            {
                ssiRtkSurvey.DataReceived -= OnDataReceived;
                ssiRtkSurvey.SurveyStateChanged -= OnSurveyStateChanged;
                ssiRtkSurvey.ReferenceStationUpdated -= OnReferenceStationUpdate;
            }

            var ssiPower = _sensor.GetInterface<ISsiPower>();
            if (ssiPower != null)
            {
                ssiPower.CurrentPowerSourceChanged -= OnPowerUpdateChanged;
            }
        }

        private void EnableSBASTracking()
        {
            try
            {
                var ssiSatellites = _sensor.GetInterface<ISsiSatellites>();
                if (ssiSatellites.IsSupported(SatelliteMaskParameterType.TrackSBAS))
                {
                    ssiSatellites.BeginGetSatelliteMask(GetSatelliteMaskCompleted);
                }
            }
            catch (Exception e)
            {
                LogException("EnableSBASTracking", e);
            }

            void GetSatelliteMaskCompleted(IAsyncResult ar)
            {
                try
                {
                    var ssiSatellites = _sensor.GetInterface<ISsiSatellites>();
                    var mask = ssiSatellites.EndGetSatelliteMask(ar);
                    var sbasParameter = mask.Parameters.OfType<ISatelliteMaskParameterTrackSBAS>().SingleOrDefault();
                    if (sbasParameter == null)
                    {
                        // actually not supported
                        return;
                    }

                    if (!sbasParameter.TrackSBAS)
                    {
                        sbasParameter.TrackSBAS = true;
                        ssiSatellites.BeginSetSatelliteMask(mask, SetSatelliteMaskCompleted);
                    }
                }
                catch (Exception e)
                {
                    LogException(nameof(EnableSBASTracking) + "." + nameof(GetSatelliteMaskCompleted), e);
                }
            }

            void SetSatelliteMaskCompleted(IAsyncResult ar)
            {
                try
                {
                    var ssiSatellites = _sensor.GetInterface<ISsiSatellites>();
                    ssiSatellites.EndSetSatelliteMask(ar);
                }
                catch (Exception e)
                {
                    LogException(nameof(EnableSBASTracking) + "." + nameof(SetSatelliteMaskCompleted), e);
                }
            }
        }

        private void ResetParameter()
        {
            _receivedCorrectionData = 0;
            _referenceStationId = 0;
        }


        private void SensorOnConnectionStateChanged(object sender, ConnectionStateChangedEventArgs connectionStateChangedEventArgs)
        {
            if (
                new List<ConnectionState>
                {
                    ConnectionState.LinkDown,
                    ConnectionState.Disconnected,
                    ConnectionState.Connected
                }.Contains(connectionStateChangedEventArgs.ConnectionState))
            {
                SensorStateChanged?.Invoke(this,
                    new SensorStateEventArgs(connectionStateChangedEventArgs.ConnectionState));
                SurveyTypeUpdate?.Invoke(this, new SurveyTypeUpdateArgs(SurveyType.None));
            }
        }

        private void SensorOnErrorOccurred(object sender, SensorErrorEventArgs sensorErrorEventArgs)
        {
            var usbEx = sensorErrorEventArgs.Exception as USBConnectionException;
            if (usbEx != null)
            {
                UsbConnectionErrorOccured?.Invoke(this, new EventArgs());
            }
            var expired = sensorErrorEventArgs.Exception as LicenseException;
            if (expired != null)
            {
                SubscriptionHasExpired?.Invoke(this, new EventArgs());
            }
        }

        private void OnDataReceived(object sender, CorrectionDataReceivedEventArgs correctionDataReceivedEventArgs)
        {
            var bytes = correctionDataReceivedEventArgs.ReceivedBytes;
            _receivedCorrectionData += bytes;
        }

        
        private void OnReferenceStationUpdate(object sender, ReferenceStationUpdateEventArgs referenceStationUpdateEventArgs)
        {
            _referenceStationId = referenceStationUpdateEventArgs.ReferenceStation.ID;
        }


        /// <summary>
        /// Get the sensor properties after succesful connection. 
		/// All sensor properties are evaluated dynamically. Therefore this call must always be performed before creating any interfaces. It shows the default approach for implementing interfaces (check if available, get interface)
        /// </summary>
        /// <param name="instrumentName">The instrument name</param>
        /// <param name="serialNumber">Serial of the sensor</param>
        /// <param name="firmware">Firmware version of the sensor</param>
        /// <param name="licensed">The license state of the sensor</param>
        /// <returns></returns>
        public DriverReturnCode GetSensorProperties(out string instrumentName, out string serialNumber, out string firmware, out bool licensed)
        {
            instrumentName = string.Empty;
            serialNumber = string.Empty;
            firmware = string.Empty;
            licensed = true;

            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            instrumentName = "";
            serialNumber = "";
            firmware = "";
            var ssiSensorProperties = _sensor.GetInterface<ISsiSensorProperties>();

            if (ssiSensorProperties == null)
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }
            if (ssiSensorProperties.HasProperty(SensorPropertyType.Name))
                instrumentName = ssiSensorProperties.GetProperty(SensorPropertyType.Name).Value;

            if (ssiSensorProperties.HasProperty(SensorPropertyType.SerialNumber))
                serialNumber = ssiSensorProperties.GetProperty(SensorPropertyType.SerialNumber).Value;

            if (ssiSensorProperties.HasProperty(SensorPropertyType.Firmware))
                firmware = ssiSensorProperties.GetProperty(SensorPropertyType.Firmware).Value;

            if (ssiSensorProperties.HasProperty(SensorPropertyType.Licensed))
                licensed = ssiSensorProperties.GetProperty(SensorPropertyType.Licensed).Value;

            return DriverReturnCode.Success;
        }

        /// <summary>
        /// The antenna height from the bottom of the antenna
        /// </summary>
        public double ReducedAntennaHeight
        {
            get { return _reducedAntennaHeight; }
            set
            {
                if (UpdateAntennaHeightConfiguration(value))
                {
                    _reducedAntennaHeight = value;
                }
            }
        }

        /// <summary>
        /// Update the antenna height configuration
        /// </summary>
        /// <param name="height">The antenna height from the bottom of the antenna</param>
        private bool UpdateAntennaHeightConfiguration(double height)
        {
            if (!IsSensorConnected())
            {
                return false;
            }

            var antenna = _sensor?.GetInterface<ISsiAntenna>()?.GetAntenna(AntennaType.Internal);

            if (antenna == null || antenna.HeightConfiguration == null)
            {
                return false;
            }

            try
            {
                antenna.HeightConfiguration = new AntennaHeightConfiguration(height, MeasurementMethod.MeasurementMethod0);
                _sensor?.GetInterface<ISsiAntenna>().SetAntenna(antenna);
                return true;
            }
            catch (Exception e)
            {
                LogException("UpdateAntennaHeightConfiguration", e);
            }
            return false;
        }

        private void OnSatellitesUpdate(object sender, SatelliteUpdateEventArgs satelliteUpdateEventArgs)
        {
            SatelliteUpdate?.Invoke(this, new SatelliteUpdateArgs(satelliteUpdateEventArgs.SatelliteContainer.Satellites.ToList()));
        }

        private void OnNewPositioningObservations(object sender, PositioningObservationEventArgs positioningObservationEventArgs)
        {
            var obs = positioningObservationEventArgs.GetObservations();

            // Solution type
            SolutionType solutionType = SolutionType.Autonomous;

            if (obs.HasObservation(ObservationType.SolutionType))
            {
                solutionType = obs.GetObservation(ObservationType.SolutionType).SolutionType;
            }

            double latitude = double.NaN;
            double longitude = double.NaN;
            double height = double.NaN;
            double elevation = double.NaN;
            string geoidModel = string.Empty;
            GroundPositionType groundPositionType = GroundPositionType.Init;

            if (obs.HasObservation(ObservationType.GroundCoordinate))
            {
                var groundCoordinate = obs.GetObservation(ObservationType.GroundCoordinate);
                var coordinates = groundCoordinate.Coordinates;
                latitude = coordinates.Latitude;
                longitude = coordinates.Longitude;
                height = coordinates.Height;
                groundPositionType = groundCoordinate.GroundPositionType;
            }
            else if (obs.HasObservation(ObservationType.Coordinate))
            {
                var coordinates = obs.GetObservation(ObservationType.Coordinate).Coordinates;
                latitude = coordinates.Latitude;
                longitude = coordinates.Longitude;
                height = coordinates.Height;
            }

            // Geoid undulation
            if (obs.HasObservation(ObservationType.GeoidUndulation))
            {
                double N = obs.GetObservation(ObservationType.GeoidUndulation).Deviation;
                if (!double.IsNaN(height) && !double.IsNaN(N))
                {
                    elevation = height - N;
                    geoidModel = obs.GetObservation(ObservationType.GeoidUndulation).GeoidModel;
                }
            }

            double heading = double.NaN;
            double horizontalVelocity = double.NaN;
            double verticalVelocity = double.NaN;

            if (obs.HasObservation(ObservationType.Velocity))
            {
                heading = obs.GetObservation(ObservationType.Velocity).Heading;
                horizontalVelocity = obs.GetObservation(ObservationType.Velocity).Horizontal;
                verticalVelocity = obs.GetObservation(ObservationType.Velocity).Vertical;
            }

            double haPrec = double.NaN;
            double vaPrec = double.NaN;

            if (obs.HasObservation(ObservationType.Precision))
            {
                haPrec = obs.GetObservation(ObservationType.Precision).HorizontalPrecision;
                vaPrec = obs.GetObservation(ObservationType.Precision).VerticalPrecision;
            }

            double sigmaSemiMajorAxis = double.NaN;
            double sigmaSemiMinorAxis = double.NaN;
            double sigmaOrientation = double.NaN;

            if (obs.HasObservation(ObservationType.PositionSigma))
            {
                sigmaSemiMajorAxis = obs.GetObservation(ObservationType.PositionSigma).SemiMajorAxis;
                sigmaSemiMinorAxis = obs.GetObservation(ObservationType.PositionSigma).SemiMinorAxis;
                sigmaOrientation = obs.GetObservation(ObservationType.PositionSigma).Orientation;
            }

            double Pdop = double.NaN;
            double Hdop = double.NaN;
            double Vdop = double.NaN;

            if (obs.HasObservation(ObservationType.DilutionOfPrecision))
            {
                Pdop = obs.GetObservation(ObservationType.DilutionOfPrecision).PDOP;
                Hdop = obs.GetObservation(ObservationType.DilutionOfPrecision).HDOP;
                Vdop = obs.GetObservation(ObservationType.DilutionOfPrecision).VDOP;
            }
            else if (obs.HasObservation(ObservationType.ExtendedDilutionOfPrecision))
            {
                Pdop = obs.GetObservation(ObservationType.ExtendedDilutionOfPrecision).PDOP;
                Hdop = obs.GetObservation(ObservationType.ExtendedDilutionOfPrecision).HDOP;
                Vdop = obs.GetObservation(ObservationType.ExtendedDilutionOfPrecision).VDOP;
            }

            double pitch = double.NaN;
            double roll = double.NaN;
            double yaw = double.NaN;
            double pitchPrecision = double.NaN;
            double rollPrecision = double.NaN;
            double yawPrecision = double.NaN;

            if (obs.HasObservation(ObservationType.Tilt))
            {
                pitch = obs.GetObservation(ObservationType.Tilt).Pitch;
                roll = obs.GetObservation(ObservationType.Tilt).Roll;
                yaw = obs.GetObservation(ObservationType.Tilt).Yaw;

                if (obs.HasObservation(ObservationType.TiltPrecision))
                {
                    pitchPrecision = obs.GetObservation(ObservationType.TiltPrecision).PitchPrecision;
                    rollPrecision = obs.GetObservation(ObservationType.TiltPrecision).RollPrecision;
                    yawPrecision = obs.GetObservation(ObservationType.TiltPrecision).YawPrecision;
                }
            }

            int numberOfSatellites = 0;
            int numberOfTrackedSatellites = 0;
            if (obs.HasObservation(ObservationType.Satellites))
            {
                numberOfSatellites = obs.GetObservation(ObservationType.Satellites).NumberOfSatellites;
                numberOfTrackedSatellites = obs.GetObservation(ObservationType.Satellites).NumberOfTrackedSatellites;
            }
            double age = double.NaN;
            if (obs.HasObservation(ObservationType.CorrectionAge))
            {
                age = obs.GetObservation(ObservationType.CorrectionAge).Age.TotalSeconds;
            }

            IReferenceSystem sourceFrame = null;
            IReferenceSystem frame = null;

            bool datumTransformationApplied = obs.HasObservation(ObservationType.ReferenceSource);

            if (obs.HasObservation(ObservationType.ReferenceSource))
            {
                sourceFrame = obs.GetObservation(ObservationType.ReferenceSource).ReferenceSystem;
            }

            if (obs.HasObservation(ObservationType.ReferenceSystem))
            {
                frame = obs.GetObservation(ObservationType.ReferenceSystem).ReferenceSystem;
            }

            int staticEpochs = 0;
            if (obs.HasObservation(ObservationType.Epoch))
            {
                staticEpochs = obs.GetObservation(ObservationType.Epoch).Epoch;
            }

            DateTime gpsTime = DateTime.MinValue;
            DateTime utcTime = gpsTime;

            if (obs.HasObservation(ObservationType.GpsTime))
            {
                var observation =
                    (IGpsTimeObservation)obs.GetObservation(ObservationType.GpsTime);
                gpsTime = observation.GpsTime;
                utcTime = gpsTime.AddSeconds(-observation.GpsUtcOffset);
            }

            ImuState imuState = ImuState.NotAvailable;

            // Error handling
            if (obs.HasObservation(ObservationType.RtkStatus))
            {
                RTKErrorStatus error = obs.GetObservation(ObservationType.RtkStatus).RTKErrorStatus;

                switch (error)
                {
                    case RTKErrorStatus.NoRTXOffshore:
                        SensorIsOutsideGeofence?.Invoke(this, new EventArgs());
                        break;
                    case RTKErrorStatus.ImuError:
                        imuState = ImuState.ErrorHasBeenDetected;
                        break;
                    case RTKErrorStatus.ImuExcessiveBias:
                        imuState = ImuState.ExcessiveBiasHasBeenDetected;
                        break;
                }
            }

            if (imuState == ImuState.NotAvailable)
            {
                if (obs.HasObservation(ObservationType.IMUAlignmentStatus))
                {
                    IMUAlignmentStatus imu = obs.GetObservation(ObservationType.IMUAlignmentStatus).AlignmentStatus;

                    switch (imu)
                    {
                        case IMUAlignmentStatus.Fine:
                            imuState = ImuState.Running;
                            break;
                        case IMUAlignmentStatus.Unaligned:
                        case IMUAlignmentStatus.Coarse:
                            imuState = ImuState.NeedsMovement;
                            break;
                    }
                }
            }

            PositionUpdate?.Invoke(this, new PositionUpdateArgs(
                solutionType,
                latitude, longitude, height, groundPositionType,
                heading, horizontalVelocity, verticalVelocity,
                haPrec, vaPrec,
                sigmaSemiMajorAxis, sigmaSemiMinorAxis, sigmaOrientation,
                imuState, pitch, roll, yaw,
                pitchPrecision, rollPrecision, yawPrecision,
                Pdop, Hdop, Vdop,
                gpsTime, utcTime,
                numberOfSatellites, numberOfTrackedSatellites, staticEpochs,
                age, _receivedCorrectionData, _referenceStationId,
                datumTransformationApplied, sourceFrame, frame,
                elevation, geoidModel));


            if (obs.HasObservation(ObservationType.RtkProgress))
            {
                var rtkProgress = obs.GetObservation(ObservationType.RtkProgress);
                if (rtkProgress.RTKProgressStatus == RTKProgressStatus.RtkAvailable
                    || rtkProgress.RTKProgressStatus == RTKProgressStatus.RtxAvailable)
                {
                    if (rtkCorrectionHubStarted)
                    {
                        Task.Run(() => restartRtkCorrectionHub?.Invoke());
                    }

                    switch (rtkProgress.RTKProgressStatus)
                    {
                        case RTKProgressStatus.RtkAvailable:
                            RtkServiceAvailable?.Invoke(this, new EventArgs());
                            break;
                        case RTKProgressStatus.RtxAvailable:
                            RtxServiceAvailable?.Invoke(this, new EventArgs());
                            break;
                    }
                }
            }

        }

        /// <summary>
        /// Is the static motion mode supported
        /// </summary>
        /// <returns>Returns true if 'going static' is supported, otherwise false</returns>
        public bool IsStaticMotionModeSupported()
        {
            var ssiPositioning = _sensor.GetInterface<ISsiPositioning>();

            if (ssiPositioning != null && ssiPositioning.IsSupported(PositioningParameterType.MotionState))
            {
                var motionState = (IPositioningParameterMotionState)ssiPositioning.CreatePositioningParameter(PositioningParameterType.MotionState);                
                return motionState.ListSupportedMotionStates().Contains(MotionState.Static);
            }

            return false;
        }

        /// <summary>
        /// Set receiver in static or roving mode.
		/// Static mode represents a measurement over a certain time (e.g. 60 seconds). While going static the receiver makes certain assumptions on the positon (only slow movement) and applies therefore advanced filters (like Kalmann)
		/// to reach a better standard deviation. Each new <see cref="OnNewPositioningObservations"/> event represents the latest value from the value - so after 55sec the event will contain a geodetic mean value of the observed location.
		/// It is not necessary to do any manual arithmetic mean calculation.
        /// </summary>
        /// <param name="staticMode">Static true or false.</param>
        /// <returns></returns>
        public DriverReturnCode SetMotionState(bool staticMode)
        {
            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            var ssiPositioning = _sensor.GetInterface<ISsiPositioning>();

            if (!ssiPositioning.IsSupported(PositioningParameterType.MotionState))
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            if (staticMode && !IsStaticMotionModeSupported())
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            var settings = new PositioningSettings();

            var motionState = (IPositioningParameterMotionState)ssiPositioning.CreatePositioningParameter(PositioningParameterType.MotionState);
            motionState.State = staticMode ? MotionState.Static : MotionState.Roving;
            settings.Add(motionState);

            try
            {
                ssiPositioning.StartPositioning(settings);
            }
            catch (Exception e)
            {
                LogException("SetMotionState",e);
                return DriverReturnCode.Error;
            }
            return DriverReturnCode.Success;
        }

        /// <summary>
        /// Is the inertial navigation mode supported
        /// </summary>
        /// <returns>Returns true if supported, otherwise false</returns>
        public bool IsInertialNavigationModeSupported(InertialNavigationMode mode)
        {
            var ssiInertialNavigation = _sensor.GetInterface<ISsiInertialNavigation>();

            if (ssiInertialNavigation == null)
                return false;

            if (!ssiInertialNavigation.IsSupported(mode))
            {
                return false;
            }

            return true;
        }

        /// <summary>
        /// Set the inertial navigation mode.
        /// </summary>
        /// <param name="mode">InertialNavigationMode.</param>
        /// <returns></returns>
        public DriverReturnCode SetInertialNavigationMode(InertialNavigationMode mode)
        {
            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            var ssiInertialNavigation = _sensor.GetInterface<ISsiInertialNavigation>();

            if (ssiInertialNavigation == null)
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            if (!ssiInertialNavigation.IsSupported(mode))
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            ssiInertialNavigation.SetInertialNavigationMode(mode);
            return DriverReturnCode.Success;
        }

        /// <summary>
        /// Get the inertial navigation mode.
        /// </summary>
        /// <param name="mode">The inertial navigation mode</param>
        /// <returns></returns>
        public DriverReturnCode GetInertialNavigationMode(out InertialNavigationMode mode)
        {
            mode = InertialNavigationMode.Off;

            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            if (!_sensor.IsSupported<ISsiInertialNavigation>())
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            var i = _sensor.GetInterface<ISsiInertialNavigation>();

            mode = i.GetInertialNavigationMode();

            return DriverReturnCode.Success;
        }

        /// <summary>
        /// Is Trimble Correction Hub (TCH) supported?
        /// </summary>
        /// <returns>Returns true if the TCH is supported</returns>
        public bool IsTrimbleCorrectionHubSupported()
        {
            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();
            if (ssiRtkSurvey == null
                || !ssiRtkSurvey.IsSupported(LinkParameterType.ControllerInternet)
                || !ssiRtkSurvey.IsSupported(LinkParameterType.ControllerInternet, CorrectionDataSourceType.TrimbleHub))
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// Start Trimble Correction Hub
        /// </summary>
        /// <param name="targetReferenceFrame">The datum <see cref="TargetReferenceFrame"/> which will be used as target datum for all positions.</param>
        /// <returns>The driver return code <see cref="DriverReturnCode"/> </returns>
        public DriverReturnCode StartTrimbleCorrectionHubSurvey(TargetReferenceFrame targetReferenceFrame = TargetReferenceFrame.UseLocalSettings)
        {
            return StartTrimbleCorrectionHubSurvey(targetReferenceFrame, 0, "");
        }

        /// <summary>
        /// Start Trimble Correction Hub
        /// </summary>
        /// <param name="targetReferenceFrame">The datum <see cref="TargetReferenceFrame"/> which will be used as target datum for all positions.</param>
        /// <param name="targetReferenceFrameId">The target reference frame id.</param>
        /// <param name="geoidGridFileFullPath">The location of the grid file used to calculate geoid undulation and elevation.</param>
        /// <returns>The driver return code <see cref="DriverReturnCode"/> </returns>
        public DriverReturnCode StartTrimbleCorrectionHubSurvey(TargetReferenceFrame targetReferenceFrame, int targetReferenceFrameId, string geoidGridFileFullPath)
        {
            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();

            if (!IsTrimbleCorrectionHubSupported())
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            var controllerInternet = (ILinkParameterControllerInternetSettings)ssiRtkSurvey.CreateLinkParameter(LinkParameterType.ControllerInternet);
            var cdsTrimbleHub = (ICorrectionDataSourceTrimbleHubSettings)ssiRtkSurvey.CreateCorrectionDataSource(CorrectionDataSourceType.TrimbleHub);
            cdsTrimbleHub.UseLocalSettings = true;
            cdsTrimbleHub.UseRTXFallBack = true;
            cdsTrimbleHub.UseSurveyMonitor = true;
            ResetParameter();
            rtkCorrectionHubStarted = true;
            restartRtkCorrectionHub = new Func<DriverReturnCode>(() =>
            {
                var result = EndSurvey();
                if (result != DriverReturnCode.Success)
                {
                    LogDebug(nameof(StartTrimbleCorrectionHubSurvey),
                        "Failed to end survey in " + nameof(restartRtkCorrectionHub));
                    return result;
                }
                result = StartSurvey(ssiRtkSurvey, controllerInternet, cdsTrimbleHub, targetReferenceFrame, targetReferenceFrameId,
                    geoidGridFileFullPath, "StartTrimbleCorrectionHubSurvey");
                if (result != DriverReturnCode.Success)
                {
                    LogDebug(nameof(StartTrimbleCorrectionHubSurvey),
                        "Failed to start survey in " + nameof(restartRtkCorrectionHub));
                }
                return result;
            });
            return StartSurvey(ssiRtkSurvey, controllerInternet, cdsTrimbleHub, targetReferenceFrame, targetReferenceFrameId, geoidGridFileFullPath, "StartTrimbleCorrectionHubSurvey");
        }

        /// <summary>
        /// Is Rtx via internet supported?
        /// </summary>
        /// <returns>Returns true if RTX is supported.</returns>
        public bool IsRtxViaInternetSupported()
        {
            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();
            if (ssiRtkSurvey == null
                || !ssiRtkSurvey.IsSupported(LinkParameterType.ControllerInternet)
                || !ssiRtkSurvey.IsSupported(LinkParameterType.ControllerInternet, CorrectionDataSourceType.RTXViaIP))
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// Start Rtx via internet.
        /// </summary>
        /// <param name="targetReferenceFrame">The datum <see cref="TargetReferenceFrame"/> which will be used as target datum for all positions.</param>
        /// <returns>
        /// The driver return code <see cref="DriverReturnCode" />
        /// </returns>
        /// <remarks>
        /// RTX via internet/ IP has better availablity compared to RTX via satellite. Its therefore the prefered RTX connection type. Details can be found on the  (<see href="http://www.trimble.com/Positioning-Services/CenterPoint-RTX.aspx?tab=Coverage">Trimble RTX web page</see>).
        /// </remarks>
        public DriverReturnCode StartRtxViaInternet(TargetReferenceFrame targetReferenceFrame = TargetReferenceFrame.UseLocalSettings)
        {
            return StartRtxViaInternet(targetReferenceFrame, 0, "");
        }

        /// <summary>
        /// Start Rtx via internet.
        /// </summary>
        /// <param name="targetReferenceFrame">The datum <see cref="TargetReferenceFrame"/> which will be used as target datum for all positions.</param>
        /// <param name="targetReferenceFrameId">The target reference frame id.</param>
        /// <param name="geoidGridFileFullPath">The location of the grid file used to calculate geoid undulation and elevation.</param>
        /// <returns>
        /// The driver return code <see cref="DriverReturnCode" />
        /// </returns>
        /// <remarks>
        /// RTX via internet/ IP has better availablity compared to RTX via satellite. Its therefore the prefered RTX connection type. Details can be found on the  (<see href="http://www.trimble.com/Positioning-Services/CenterPoint-RTX.aspx?tab=Coverage">Trimble RTX web page</see>).
        /// </remarks>
        public DriverReturnCode StartRtxViaInternet(TargetReferenceFrame targetReferenceFrame, int targetReferenceFrameId, string geoidGridFileFullPath)
        {
            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();

            if (!IsRtxViaInternetSupported())
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            var controllerInternet = (ILinkParameterControllerInternetSettings)ssiRtkSurvey.CreateLinkParameter(LinkParameterType.ControllerInternet);
            var cdsRTXViaIP = (ICorrectionDataSourceRtxViaIpSettings)ssiRtkSurvey.CreateCorrectionDataSource(CorrectionDataSourceType.RTXViaIP);

            cdsRTXViaIP.Stream = RTXDataStream.RTXAUTO;

            ResetParameter();
            return StartSurvey(ssiRtkSurvey, controllerInternet, cdsRTXViaIP, targetReferenceFrame, targetReferenceFrameId, geoidGridFileFullPath, "StartRtxViaInternet");
        }

        /// <summary>
        /// Is Rtx via LBand supported?
        /// </summary>
        /// <returns>Returns true if RTX via satellite (LBand) is supported.</returns>
        public bool IsRtxViaSatelliteSupported()
        {
            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();
            if (ssiRtkSurvey == null
                || !ssiRtkSurvey.IsSupported(LinkParameterType.RTXSatellite)
                || !ssiRtkSurvey.IsSupported(LinkParameterType.RTXSatellite, CorrectionDataSourceType.RTXViaSatellite))
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// Start Rtx via LBand
        /// </summary>
        /// <param name="targetReferenceFrame">The datum <see cref="TargetReferenceFrame"/> which will be used as target datum for all positions.</param>
        /// <returns>The driver return code <see cref="DriverReturnCode"/> </returns>
        /// <remarks>
        /// RTX via internet/ IP has better availablity compared to RTX via satellite. Its therefore the prefered RTX connection type. Details can be found on the  (<see href="http://www.trimble.com/Positioning-Services/CenterPoint-RTX.aspx?tab=Coverage">Trimble RTX web page</see>).
        /// </remarks>
        public DriverReturnCode StartRtxViaSatellite(TargetReferenceFrame targetReferenceFrame = TargetReferenceFrame.UseLocalSettings)
        {
            return StartRtxViaSatellite(targetReferenceFrame, 0, "");
        }

        /// <summary>
        /// Start Rtx via LBand
        /// </summary>
        /// <param name="targetReferenceFrame">The datum <see cref="TargetReferenceFrame"/> which will be used as target datum for all positions.</param>
        /// <param name="targetReferenceFrameId">The target reference frame id.</param>
        /// <param name="geoidGridFileFullPath">The location of the grid file used to calculate geoid undulation and elevation.</param>
        /// <returns>The driver return code <see cref="DriverReturnCode"/> </returns>
        /// <remarks>
        /// RTX via internet/ IP has better availablity compared to RTX via satellite. Its therefore the prefered RTX connection type. Details can be found on the  (<see href="http://www.trimble.com/Positioning-Services/CenterPoint-RTX.aspx?tab=Coverage">Trimble RTX web page</see>).
        /// </remarks>
        public DriverReturnCode StartRtxViaSatellite(TargetReferenceFrame targetReferenceFrame, int targetReferenceFrameId, string geoidGridFileFullPath)
        {
            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();

            if (!IsRtxViaSatelliteSupported())
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            var rtxSatellite = (ILinkParameterRTXSatelliteSettings)ssiRtkSurvey.CreateLinkParameter(LinkParameterType.RTXSatellite);
            var cdsRTXViaSatellite = (ICorrectionDataSourceRtxViaSatelliteSettings)ssiRtkSurvey.CreateCorrectionDataSource(CorrectionDataSourceType.RTXViaSatellite);

            ResetParameter();

            return StartSurvey(ssiRtkSurvey, rtxSatellite, cdsRTXViaSatellite, targetReferenceFrame, targetReferenceFrameId, geoidGridFileFullPath, "StartRtxViaSatellite");
        }

        /// <summary>
        /// StartSurvey applies correction data to the receiver engine. Up until now all position were pure autonomous; if the survey started successfully correction data gets applied (RTK, RTX, SBAS etc). 
        /// </summary>
        /// <param name="ssiRtkSurvey">For details see <see cref="ISsiRtkSurvey"/></param>
        /// <param name="linkParameter">For details see <see cref="ILinkParameter"/></param>
        /// <param name="correctionDataSource">For details see <see cref="ICorrectionDataSource"/></param>
        /// <param name="targetReferenceFrame">The datum <see cref="TargetReferenceFrame"/> which will be used as target datum for all positions.</param>
        /// <param name="targetReferenceFrameId">The target reference frame id.</param>
        /// <param name="geoidGridFileFullPath">The location of the grid file used to calculate geoid undulation and elevation.</param>
        /// <param name="surveyTypeString"></param>
        //// <returns>The driver return code <see cref="DriverReturnCode"/> </returns>
        private DriverReturnCode StartSurvey(ISsiRtkSurvey ssiRtkSurvey, ILinkParameter linkParameter, ICorrectionDataSource correctionDataSource, TargetReferenceFrame targetReferenceFrame, int targetReferenceFrameId, string geoidGridFileFullPath, string surveyTypeString)
        {
            DriverReturnCode returnCode = DriverReturnCode.Success;

            try
            {
                var datumTransformationTimeDependent =
                    CreateTimeDependentTransformation(ssiRtkSurvey, targetReferenceFrame, targetReferenceFrameId);

                var verticalAdjustment = CreateVerticalAdjustment(ssiRtkSurvey, geoidGridFileFullPath);

                var correctionDataSourceTCP = correctionDataSource as ICorrectionDataSourceTCPSettings;
                if (correctionDataSourceTCP != null)
                {
                    correctionDataSourceTCP.ConnectionStatusChanged += CorrectionDataSourceOnConnectionStatusChanged;
                }
                var correctionDataSourceTCH = correctionDataSource as ICorrectionDataSourceTrimbleHubSettings;
                if (correctionDataSourceTCH != null)
                {
                    correctionDataSourceTCH.ConnectionStatusChanged += CorrectionDataSourceOnConnectionStatusChanged;
                }
                ssiRtkSurvey.StartSurvey(new SurveySettings(linkParameter, correctionDataSource, Enumerable.Empty<IRtkFeature>(), datumTransformationTimeDependent, verticalAdjustment));
            }
            catch (NTRIPSetupException e)
            {
                returnCode = DriverReturnCode.ErrorStartNTRIP;
                LogException(surveyTypeString, e);
                if (e.HasSetupFailed)
                {
                    returnCode = DriverReturnCode.ErrorSetupNTRIP;
                }
                if (e.IsAuthorizationFaulty)
                {
                    returnCode = DriverReturnCode.ErrorNtripLoginFailed;
                }
                if (e.IsMountpointWrong)
                {
                    returnCode = DriverReturnCode.ErrorWrongMountPoint;
                }
                if (e.IsRoverOutsideVRSNetwork)
                {
                    returnCode = DriverReturnCode.ErrorRoverOutsideVRSNetwork;
                }
            }
            catch (ArgumentException e)
            {
                returnCode = DriverReturnCode.ErrorInvalidParameter;
                LogException(surveyTypeString, e);
            }
            catch (InternetNotConnectedException e)
            {
                returnCode = DriverReturnCode.ErrorInternetNotConnected;
                LogException(surveyTypeString, e);
            }
            catch (Exception e)
            {
                returnCode = DriverReturnCode.Error;
                LogException(surveyTypeString, e);
            }
            return returnCode;
        }

        private void CorrectionDataSourceOnConnectionStatusChanged(object sender,
            NtripConnectionStatusChangedEventArgs ntripConnectionStatusChangedEventArgs)
        {
            RtkConnectionStatusUpdate?.Invoke(sender,
                new RtkConnectionStatusArgs(RtkConnectionStatusMap.Map.MapKeyToValue(ntripConnectionStatusChangedEventArgs.Status)));
        }

        /// <summary>
        /// Is RTK via Ntrip supported?
        /// </summary>
        /// <returns>Returns true if RTK is supported, otherwise false.</returns>
        public bool IsRtkViaNtripSupported()
        {
            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();
            if (ssiRtkSurvey == null
                || !ssiRtkSurvey.IsSupported(LinkParameterType.ControllerInternet)
                || !ssiRtkSurvey.IsSupported(LinkParameterType.ControllerInternet, CorrectionDataSourceType.NTRIP))
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// Download Ntrip source table
        /// </summary>
        /// <param name="serverAddress">Something like www.vrsnow.de</param>
        /// <param name="port">Something like '2101'</param>
        /// <param name="sourceTable">Raw mount table list without STR field</param>
        /// <param name="username">The NTRIP user name, needed for some NTRIP/ IBSS casters</param>
        /// <param name="password">The NTRIP password, needed for some NTRIP/ IBSS casters</param>
        /// <returns>The driver return code <see cref="DriverReturnCode"/> </returns>
		/// <remarks>Note that Trimble Catalyst ONLY supports RTCM message formats (RTCM 3.1 or higher) as of the date of this document.</remarks>
        public DriverReturnCode GetNtripSourceTable(string serverAddress, int port, out IEnumerable<string[]> sourceTable, string username = "", string password = "")
        {
            sourceTable = Enumerable.Empty<string[]>();

            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }
            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();

            if (ssiRtkSurvey.SurveyState != SurveyState.NotRunning)
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            var controllerInternet = (ILinkParameterControllerInternetSettings)ssiRtkSurvey.CreateLinkParameter(LinkParameterType.ControllerInternet);
            var correctionDataSourceNtrip = (ICorrectionDataSourceNTRIPSettings)ssiRtkSurvey.CreateCorrectionDataSource(CorrectionDataSourceType.NTRIP);
            correctionDataSourceNtrip.ServerAddress = serverAddress;
            correctionDataSourceNtrip.ServerPort = port;
            correctionDataSourceNtrip.User = username;
            correctionDataSourceNtrip.Password = password;
            IEnumerable<string[]> sourceTableTemp = Enumerable.Empty<string[]>();
            correctionDataSourceNtrip.MountPointRequested += (sender, args) =>
            {
                sourceTableTemp = args.LoadMountPointSourceTable();

                try
                {
                    ssiRtkSurvey.CancelStartSurvey();
                }
                catch
                {
                    try
                    {
                        ssiRtkSurvey.EndSurvey();
                    }
                    catch
                    {

                    }
                }
            };
            var returnCode = DriverReturnCode.Success;

            ManualResetEvent waitForMountPoint = new ManualResetEvent(false);
            ssiRtkSurvey.BeginStartSurvey(new SurveySettings(controllerInternet, correctionDataSourceNtrip), ar =>
            {
                try
                {
                    ssiRtkSurvey.EndStartSurvey(ar);
                }
                catch (Exception e)
                {
                    if (!sourceTableTemp.Any())
                    {
                        LogException("GetMountpoints", e);
                    }
                }

                waitForMountPoint.Set();
            });

            waitForMountPoint.WaitOne();

            var tableTemp = sourceTableTemp.ToList();
            if (tableTemp.Any())
            {
                sourceTable = tableTemp;
            }
            else
            {
                if (ssiRtkSurvey.SurveyState == SurveyState.Running)
                {
                    EndSurvey();
                }
                returnCode = DriverReturnCode.ErrorGetSourceTable;

            }
            return returnCode;
        }

        /// <summary>
        /// Start RTK via NTRIP
        /// </summary>
        /// <param name="serverAddress">Something like www.vrsnow.de</param>
        /// <param name="port">Something like '2101'.</param>
        /// <param name="user">The username for the local NTRIP account.</param>
        /// <param name="password">The password for the local NTRIP account.</param>
        /// <param name="mountPoint">The selected mountpoint as detected in <see cref="GetNtripSourceTable" /></param>
        /// <param name="targetReferenceFrame">The datum <see cref="TargetReferenceFrame"/> which will be used as target datum for all positions.</param>
        /// <returns>
        /// The driver return code <see cref="DriverReturnCode" />
        /// </returns>
        public DriverReturnCode StartRTKViaNtrip(string serverAddress, int port, string user, string password, string mountPoint, TargetReferenceFrame targetReferenceFrame = TargetReferenceFrame.UseLocalSettings)
        {
            return StartRTKViaNtrip( serverAddress, port, user, password, mountPoint, targetReferenceFrame, "");
        }


        /// <summary>
        /// Start RTK via NTRIP
        /// </summary>
        /// <param name="serverAddress">Something like www.vrsnow.de</param>
        /// <param name="port">Something like '2101'.</param>
        /// <param name="user">The username for the local NTRIP account.</param>
        /// <param name="password">The password for the local NTRIP account.</param>
        /// <param name="mountPoint">The selected mountpoint as detected in <see cref="GetNtripSourceTable" /></param>
        /// <param name="targetReferenceFrame">The datum <see cref="TargetReferenceFrame"/> which will be used as target datum for all positions.</param>
        /// <param name="geoidGridFileFullPath">The location of the grid file used to calculate geoid undulation and elevation.</param>
        /// <returns>
        /// The driver return code <see cref="DriverReturnCode" />
        /// </returns>
        public DriverReturnCode StartRTKViaNtrip(string serverAddress, int port, string user, string password, string mountPoint, TargetReferenceFrame targetReferenceFrame, string geoidGridFileFullPath)
        {
            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();

            if (!IsRtkViaNtripSupported())
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }


            var controllerInternet = (ILinkParameterControllerInternetSettings)ssiRtkSurvey.CreateLinkParameter(LinkParameterType.ControllerInternet);
            var cdsNtrip = (ICorrectionDataSourceNTRIPSettings)ssiRtkSurvey.CreateCorrectionDataSource(CorrectionDataSourceType.NTRIP);

            cdsNtrip.DataFormat = CorrectionDataFormat.RTCMVRS;
            cdsNtrip.ServerAddress = serverAddress;
            cdsNtrip.ServerPort = port;
            cdsNtrip.User = user;
            cdsNtrip.Password = password;
            cdsNtrip.MountPoint = mountPoint;

            ResetParameter();
            return StartSurvey(ssiRtkSurvey, controllerInternet, cdsNtrip, targetReferenceFrame, 0, geoidGridFileFullPath, "StartRTKViaNtrip");
        }


        /// <summary>
        /// Is RTK via direct internet connection supported?
        /// </summary>
        /// <returns>Returns true is RTK via direct IP is supported (DirectIP = VRS without username/ password/ mountpoint).</returns>
        public bool IsRtkViaDirectIpSupported()
        {
            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();
            if (ssiRtkSurvey == null
                || !ssiRtkSurvey.IsSupported(LinkParameterType.ControllerInternet)
                || !ssiRtkSurvey.IsSupported(LinkParameterType.ControllerInternet, CorrectionDataSourceType.DirectIP))
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// Start RTK via direct internet connection
        /// </summary>
        /// <param name="serverAddress">Something like www.vrsnow.de</param>
        /// <param name="port">Something like '2101'.</param>
        /// <param name="targetReferenceFrame">The datum <see cref="TargetReferenceFrame"/> which will be used as target datum for all positions.</param>
        /// <returns>
        /// The driver return code <see cref="DriverReturnCode" />
        /// </returns>
        /// <remarks>
        /// Note that Trimble Catalyst ONLY supports RTCM message formats (RTCM 3.1 or higher) as of the date of this document.
        /// </remarks>
        public DriverReturnCode StartRTKViaDirectIp(string serverAddress, int port, TargetReferenceFrame targetReferenceFrame = TargetReferenceFrame.UseLocalSettings)
        {
            return StartRTKViaDirectIp(serverAddress, port, targetReferenceFrame, "");
        }

        /// <summary>
        /// Start RTK via direct internet connection
        /// </summary>
        /// <param name="serverAddress">Something like www.vrsnow.de</param>
        /// <param name="port">Something like '2101'.</param>
        /// <param name="targetReferenceFrame">The datum <see cref="TargetReferenceFrame"/> which will be used as target datum for all positions.</param>
        /// <param name="geoidGridFileFullPath">The location of the grid file used to calculate geoid undulation and elevation.</param>
        /// <returns>
        /// The driver return code <see cref="DriverReturnCode" />
        /// </returns>
        /// <remarks>
        /// Note that Trimble Catalyst ONLY supports RTCM message formats (RTCM 3.1 or higher) as of the date of this document.
        /// </remarks>
        public DriverReturnCode StartRTKViaDirectIp(string serverAddress, int port, TargetReferenceFrame targetReferenceFrame, string geoidGridFileFullPath)
        {
            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();

            if (!IsRtkViaDirectIpSupported())
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }


            var controllerInternet = (ILinkParameterControllerInternetSettings)ssiRtkSurvey.CreateLinkParameter(LinkParameterType.ControllerInternet);
            var cdsDirectIp = (ICorrectionDataSourceDirectIPSettings)ssiRtkSurvey.CreateCorrectionDataSource(CorrectionDataSourceType.DirectIP);

            cdsDirectIp.DataFormat = CorrectionDataFormat.RTCM32;

            cdsDirectIp.ServerAddress = serverAddress;
            cdsDirectIp.ServerPort = port;

            ResetParameter();

            return StartSurvey(ssiRtkSurvey, controllerInternet, cdsDirectIp, targetReferenceFrame, 0, geoidGridFileFullPath, "StartRTKViaDirectIp");
        }

        private void OnPowerUpdateChanged(object sender, PowerSourceEventArgs e)
        {
            IPowerSource powerSource = e.PowerSource;

            PowerSourceState state = new PowerSourceState(-1, true);
            
            if (powerSource != null)
            {
                if (powerSource.PowerSourceType == PowerSourceType.ExternalPower)
                {
                    state = new PowerSourceState(-1, true);
                }
                if (powerSource.PowerSourceType == PowerSourceType.InternalBattery)
                {
                    IBattery battery = (IBattery)powerSource;
                    state = new PowerSourceState(battery.Level, false);
                }
            }

            PowerSourceUpdate?.Invoke(sender, state);
        }

        /// <summary>
        /// Get current survey
        /// </summary>
        /// <returns>The current survey <see cref="SurveyType"/> </returns>
        public SurveyType GetCurrentSurvey()
        {
            if (!IsSensorConnected())
            {

                return SurveyType.None;
            }

            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();

            if (ssiRtkSurvey?.SurveySettings == null) return SurveyType.None;

            switch (ssiRtkSurvey.SurveySettings.CorrectionDataSource.Type)
            {
                case CorrectionDataSourceType.NTRIP:
                    return SurveyType.RtkViaNtrip;
                case CorrectionDataSourceType.RTXViaIP:
                    return SurveyType.RtxViaInternet;
                case CorrectionDataSourceType.RTXViaSatellite:
                    return SurveyType.RtxViaSatellite;
                case CorrectionDataSourceType.TrimbleHub:
                    return SurveyType.TrimbleCorrectionHub;
            }

            return SurveyType.None;
        }


        /// <summary>
        /// End current survey
        /// </summary>
        /// <returns>The driver return code <see cref="DriverReturnCode"/> </returns>
        public DriverReturnCode EndSurvey()
        {
            rtkCorrectionHubStarted = false;

            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }
            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();
            DriverReturnCode returnCode = DriverReturnCode.Success;

            if (ssiRtkSurvey == null)
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            ResetParameter();
            try
            {
                var correctionSourceTCP =
                    ssiRtkSurvey.SurveySettings?.CorrectionDataSource as ICorrectionDataSourceTCPSettings;
                if (correctionSourceTCP != null)
                {
                    correctionSourceTCP.ConnectionStatusChanged -= CorrectionDataSourceOnConnectionStatusChanged;
                }
                var correctionSourceTCH =
                    ssiRtkSurvey.SurveySettings?.CorrectionDataSource as ICorrectionDataSourceTrimbleHubSettings;
                if (correctionSourceTCH != null)
                {
                    correctionSourceTCH.ConnectionStatusChanged -= CorrectionDataSourceOnConnectionStatusChanged;
                }
                ssiRtkSurvey.EndSurvey();
            }
            catch (Exception e)
            {
                returnCode = DriverReturnCode.Error;
                LogException("EndSurvey", e);
            }
            return returnCode;
        }


        /// <summary>
        /// Triggered when sensor connection state changes.
        /// </summary>
        public event EventHandler<SensorStateEventArgs> SensorStateChanged;

        /// <summary>
        /// Triggered when usb communnicaton error occured
        /// </summary>
        public event EventHandler<EventArgs> UsbConnectionErrorOccured;

        /// <summary>
        /// The running subscription has expired now
        /// </summary>
        public event EventHandler<EventArgs> SubscriptionHasExpired;

        /// <summary>
        /// The sensor is outside supported area
        /// </summary>
        public event EventHandler<EventArgs> SensorIsOutsideGeofence;

        /// <summary>
        /// Triggered on new SV information
        /// </summary>
        public event EventHandler<SatelliteUpdateArgs> SatelliteUpdate;

        /// <summary>
        /// Triggered on new position update
        /// </summary>
        public event EventHandler<PositionUpdateArgs> PositionUpdate;

        /// <summary>
        /// Triggered when RTK service might be available.
        /// </summary>
        public event EventHandler<EventArgs> RtkServiceAvailable;

        /// <summary>
        /// Triggered when RTX service might be available.
        /// </summary>
        public event EventHandler<EventArgs> RtxServiceAvailable;

        /// <summary>
        /// Triggered when RTK connection status changes.
        /// </summary>
        public event EventHandler<RtkConnectionStatusArgs> RtkConnectionStatusUpdate;

        /// <summary>
        /// Triggered when survey type changes.
        /// </summary>
        public event EventHandler<SurveyTypeUpdateArgs> SurveyTypeUpdate;

        /// <summary>
        /// Triggered when state of current powersource changes
        /// </summary>
        public event EventHandler<PowerSourceState> PowerSourceUpdate;

        /// <summary>
        /// Is Datum Transformation supported?
        /// </summary>
        /// <returns>Returns true if the Datum Transformation is supported</returns>
        public bool IsDatumTransformationSupported()
        {
            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();
            return (ssiRtkSurvey != null);
        }

        /// <summary>
        /// Is Vertical Adjustment supported?
        /// </summary>
        /// <returns>Returns true if the Vertical Adjustment is supported</returns>
        public bool IsVerticalAdjustmentSupported()
        {
            var ssiRtkSurvey = _sensor.GetInterface<ISsiRtkSurvey>();
            return (ssiRtkSurvey != null);
        }
        
        private class RtkConnectionStatusMap : MappingTable<RtkConnectionStatusMap, GPRSNtripStartStatus, RtkConnectionStatus>
        {
            protected override void Fill()
            {
                /* First few intermediate states in NTRIP connection are mapped to StartingNTRIP */
                Add(GPRSNtripStartStatus.Prepare, RtkConnectionStatus.StartingNTRIP);
                Add(GPRSNtripStartStatus.CheckPPP, RtkConnectionStatus.StartingNTRIP);
                Add(GPRSNtripStartStatus.InitPPP, RtkConnectionStatus.StartingNTRIP);
                Add(GPRSNtripStartStatus.CheckPin, RtkConnectionStatus.StartingNTRIP);
                Add(GPRSNtripStartStatus.StartPPP, RtkConnectionStatus.StartingNTRIP);
                Add(GPRSNtripStartStatus.PPPRunning, RtkConnectionStatus.StartingNTRIP);
                Add(GPRSNtripStartStatus.StartNTRIP, RtkConnectionStatus.StartingNTRIP);
                Add(GPRSNtripStartStatus.GetSourceTable, RtkConnectionStatus.StartingNTRIP);
                Add(GPRSNtripStartStatus.GetSourceTableCount, RtkConnectionStatus.StartingNTRIP);

                Add(GPRSNtripStartStatus.WaitCorrectiondata, RtkConnectionStatus.WaitingCorrectiondata);
                Add(GPRSNtripStartStatus.NTRIPRunning, RtkConnectionStatus.NTRIPRunning);
                Add(GPRSNtripStartStatus.StartRTXViaIP, RtkConnectionStatus.StartingRTXViaIP);
                Add(GPRSNtripStartStatus.RTXViaIPRunning, RtkConnectionStatus.RTXViaIPRunning);
                Add(GPRSNtripStartStatus.StartRTXViaSatellite, RtkConnectionStatus.StartingRTXViaSatellite);
                Add(GPRSNtripStartStatus.RTXViaSatelliteRunning, RtkConnectionStatus.RTXViaSatelliteRunning);
            }
        }

        private IDatumTransformationTimeDependent CreateTimeDependentTransformation(ISsiRtkSurvey ssiRtkSurvey, TargetReferenceFrame targetReferenceFrame, int targetReferenceFrameId)
        {
            if (!IsDatumTransformationSupported())
            {
                return null;
            }
            var datumTransformation = ssiRtkSurvey.CreateDatumTransformation(TrimbleIdLoginSuccessful);

            if (datumTransformation == null)
                return null;

            // Source is via default AutoSelection

            switch (targetReferenceFrame)
            {
                case TargetReferenceFrame.Off:
                    datumTransformation = null;
                    break;
                case TargetReferenceFrame.ToGlobal:
                    // ReferenceFrameID  ITRF2020
                    datumTransformation.TargetFrame.ReferenceFrameId = 305;
                    datumTransformation.TargetFrame.ReferenceFrameEpoch = ReferenceFrameEpoch.Current;
                    break;
                case TargetReferenceFrame.ToLocal:
                    // ReferenceFrameID AutoSelection
                    datumTransformation.TargetFrame.ReferenceFrameId = 0;
                    datumTransformation.TargetFrame.ReferenceFrameEpoch = ReferenceFrameEpoch.Reference;
                    break;
                case TargetReferenceFrame.ToFixGlobal:
                    // ReferenceFrameID  ITRF2020
                    datumTransformation.TargetFrame.ReferenceFrameId = 305;
                    datumTransformation.TargetFrame.ReferenceFrameEpoch = ReferenceFrameEpoch.Reference;
                    break;
                case TargetReferenceFrame.UseLocalSettings:
                    break;
                case TargetReferenceFrame.ToLocalWithTargetReferenceFrame:
                    // Source is not activated
                    datumTransformation.SourceFrame.ReferenceFrameId = -2;
                    datumTransformation.SourceFrame.ReferenceFrameEpoch = ReferenceFrameEpoch.Reference;
                    // Target from user
                    datumTransformation.TargetFrame.ReferenceFrameId = targetReferenceFrameId;
                    datumTransformation.TargetFrame.ReferenceFrameEpoch = ReferenceFrameEpoch.Reference;
                    break;
            }
            return datumTransformation;
        }

        private IVerticalAdjustment CreateVerticalAdjustment(ISsiRtkSurvey ssiRtkSurvey, string geoidGridFileFullPath)
        {
            if (!IsVerticalAdjustmentSupported())
            {
                return null;
            }

            var verticalAdjustment = ssiRtkSurvey.CreateVerticalAdjustment(TrimbleIdLoginSuccessful);

            if (verticalAdjustment == null)
                return null;


            if (!string.IsNullOrEmpty(geoidGridFileFullPath))
            { 
                verticalAdjustment.GeoidGridFileFullPath = geoidGridFileFullPath;  
            }

            return verticalAdjustment;
        }

        /// <summary>
        /// Returns battery level of external receiver in percent 
        /// </summary>
        /// <returns>0 = unknown</returns>
        public int GetExternalReceiverBatteryLevel()
        {
            try
            {
                if (!this.IsSensorConnected())
                {
                    return 0;
                }

                ISsiPower power = _sensor.GetInterface<ISsiPower>();
                var battery = power?.CurrentPowerSource as IBattery;

                return battery?.Level ?? 0;
            }
            catch
            {
                return 0;
            }
        }

        /// <summary>
        /// Installs a subscription
        /// </summary>
        /// <param name="optionCode"></param>
        /// <returns></returns>
        public DriverReturnCode InstallSubscriptions(string optionCode)
        {
            if (CurrentDriverType == DriverType.Catalyst)
            {
                return DriverReturnCode.DeviceTypeNotSupported;
            }

            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            var i = _sensor.GetInterface<ISsiOptionCode>();

            try
            {
                i.InstallOptionCode(optionCode);
            }
            catch (SsiException)
            {
                return DriverReturnCode.ErrorInvalidParameter;
            }

            return DriverReturnCode.Success;
        }

        /// <summary>
        /// Get list of installed options
        /// </summary>
        /// <param name="subscriptions">list of installed options</param>
        /// <returns></returns>
        public DriverReturnCode GetRTXSubscriptions(out List<ISubscription> subscriptions)
        {
            subscriptions = new List<ISubscription>();

            if (CurrentDriverType == DriverType.Catalyst)
            {
                return DriverReturnCode.DeviceTypeNotSupported;
            }

            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            if (!_sensor.IsSupported<ISsiSubscriptions>())
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            var i = _sensor.GetInterface<ISsiSubscriptions>();

            BuildSubscriptionList(i, subscriptions, SubscriptionTypeGnss.RTX);
            BuildSubscriptionList(i, subscriptions, SubscriptionTypeGnss.RTXFast);
            BuildSubscriptionList(i, subscriptions, SubscriptionTypeGnss.FieldPointRTX);
            BuildSubscriptionList(i, subscriptions, SubscriptionTypeGnss.RangePointRTX);
            BuildSubscriptionList(i, subscriptions, SubscriptionTypeGnss.ViewPointRTX);

            return DriverReturnCode.Success;
        }

        private void BuildSubscriptionList(ISsiSubscriptions i, List<ISubscription> container, SubscriptionType<ISubscription> subscriptionType)
        {
            if (i.HasSubscription(subscriptionType))
            {
                container.Add(i.GetSubscription(subscriptionType));
            }
        }

        /// <summary>
        /// Sets position rate to the specified value
        /// </summary>
        /// <param name="positionRate">Output Rate for position</param>
        /// <returns></returns>
        public DriverReturnCode SetOutputPositionRate(PositionRate positionRate)
        {
            if (!IsSensorConnected())
            {
                return DriverReturnCode.ErrorNotConnected;
            }

            if (!_sensor.IsSupported<ISsiPositioning>())
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            var i = _sensor.GetInterface<ISsiPositioning>();

            if (!i.IsSupported(PositioningParameterType.PositionRate))
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            var positioningParameter = (IPositioningParameterRate) i.CreatePositioningParameter(PositioningParameterType.PositionRate);
            if (!positioningParameter.ListSupportedPositionRates().Contains(positionRate))
            {
                return DriverReturnCode.ErrorFunctionNotSupported;
            }

            positioningParameter.Rate = positionRate;

            PositioningSettings positioningSettings = new PositioningSettings(new []{positioningParameter});

            try
            {
                i.StartPositioning(positioningSettings);
            }
            catch (Exception e)
            {
                LogException("SetOutputPositionRate",e);
                return DriverReturnCode.Error;
            }

            return DriverReturnCode.Success;
        }

        /// <summary>
        /// Configured receiver name
        /// </summary>
        /// <param name="driverType"></param>
        /// <param name="bluetoothName"></param>
        /// <returns></returns>
        public string GetReceiverName(DriverType driverType, string bluetoothName)
        {
            switch (driverType)
            {
                case DriverType.Catalyst:
                    return "DA1";
                case DriverType.TrimbleGNSS:
                    return bluetoothName;
                case DriverType.Mock:
                    return "MOCK";
                case DriverType.SpectraPrecision:
                    return "BT";
                case DriverType.EM100:
                    return "EM100";
                case DriverType.TDC150:
                    return "TDC";
            }
            return "EMPTY";
        }
    }
}