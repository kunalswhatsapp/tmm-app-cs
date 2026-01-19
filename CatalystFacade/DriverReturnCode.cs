namespace CatalystFacade
{
    /// <summary>
    /// These values can be returned by the driver itself. They contain error information about the failed call.
    /// </summary>
    public enum DriverReturnCode
    {
        /// <summary>
        /// Success
        /// </summary>
        Success = 0,

        /// <summary>
        /// Generic error
        /// </summary>
        Error = 1,

        /// <summary>
        ///  Unable to load the driver
        /// </summary>
        ErrorLoadingDriver,

        /// <summary>
        /// License error, no license.
        /// </summary>
        ErrorNoLicense,

        /// <summary>
        /// Sensor is already used from another application
        /// Foreign application needs to release first connection
        /// </summary>
        ErrorSensorAlreadyInUse,

        /// <summary>
        ///  Sensor already connected
        /// </summary>
        ErrorAlreadyConnected,

        /// <summary>
        ///  No sensor connected
        /// </summary>
        ErrorNotConnected,

        /// <summary>
        ///  Process canceled by user
        /// </summary>
        ErrorCancelledFromUser,

        /// <summary>
        ///  Invalid parameters
        /// </summary>
        ErrorInvalidParameter,

        /// <summary>
        ///  Function not supported by the instrument
        /// </summary>
        ErrorFunctionNotSupported,

        /// <summary>
        /// Internet connection not available
        /// </summary>
        ErrorInternetNotConnected,

        /// <summary>
        ///  NTRIP setup is invalid or not accepted by the server
        /// </summary>
        ErrorSetupNTRIP,

        /// <summary>
        ///  Failed to start NTRIP client
        /// </summary>
        ErrorStartNTRIP,

        /// <summary>
        ///  Unable to download sourcetable from caster
        /// </summary>
        ErrorGetSourceTable,

        /// <summary>
        ///  Provided NTRIP username or password wrong
        /// </summary>
        ErrorNtripLoginFailed,

        /// <summary>
        ///  Mount point does not exists
        /// </summary>
        ErrorWrongMountPoint,

        /// <summary>
        /// The sensor is outside VRS network
        /// </summary>
        ErrorRoverOutsideVRSNetwork,

        /// <summary>
        /// The device type is not supported
        /// </summary>
        DeviceTypeNotSupported
    }
}