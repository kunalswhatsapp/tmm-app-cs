using System;
using Trimble.Ssi.Interfaces.Gnss.Positioning;
using Trimble.Ssi.Interfaces.Gnss.Rtk;

namespace CatalystFacade
{

    public class PositionUpdateArgs : EventArgs
    {
        /// <summary>
        /// The solution type
        /// </summary>
        public SolutionType Solution { get; }
        /// <summary>
        /// The latitude in radian
        /// </summary>
        public double Latitude { get; }
        /// <summary>
        /// The longitude in radian
        /// </summary>
        public double Longitude { get; }
        /// <summary>
        /// The height above ellipsoid in meters
        /// </summary>
        public double Height { get; }
        /// <summary>
        /// The ground position type
        /// </summary>
        public GroundPositionType GroundPositionType { get; }
        /// <summary>
        // The heading is the WGS84 referenced true north heading in radian.
        /// </summary>
        public double Heading { get; set; }
        /// <summary>
        /// The horizontal velocity in meters per second.
        /// </summary>
        public double HorizontalVelocity { get; }
        /// <summary>
        /// The vertical velocity in meters per second.
        /// </summary>
        public double VerticalVelocity { get; }
        /// <summary>
        /// The horizontal precision
        /// </summary>
        public double HorizontalPrecision { get; }
        /// <summary>
        /// The vertical precision
        /// </summary>
        public double VerticalPrecision { get; }
        /// <summary>
        ///  The semi major axis (error ellipse semi-major axis sigma error)
        /// </summary>
        public double SigmaSemiMajorAxis { get; }
        /// <summary>
        /// The semi minor axis (error ellipse semi-minor axis sigma error)
        /// </summary>
        public double SigmaSemiMinorAxis { get; }
        /// <summary>
        /// The orientation (error ellipse orientation)
        /// </summary>
        public double SigmaOrientation { get; }

        /// <summary>
        /// The imu state
        /// </summary>
        public ImuState InertialMeasurementUnitState { get; }

        /// <summary>
        /// The pitch
        /// </summary>
        public double Pitch { get; }

        /// <summary>
        /// The roll
        /// </summary>
        public double Roll { get; }

        /// <summary>
        /// The yaw
        /// </summary>
        public double Yaw { get; }

        /// <summary>
        /// The pitch standard deviation.
        /// </summary>
        public double PitchPrecision { get; }

        /// <summary>
        /// The roll standard deviation.
        /// </summary>
        public double RollPrecision { get; }

        /// <summary>
        /// The yaw standard deviation.
        /// </summary>
        public double YawPrecision { get; }

        /// <summary>
        /// The position dilution of precision.
        /// </summary>
        public double Pdop { get; }
        /// <summary>
        /// The horizontal dilution of precision.
        /// </summary>
        public double Hdop { get; }
        /// <summary>
        /// The vertical dilution of precision.
        /// </summary>
        public double Vdop { get; }

        /// <summary>
        /// GPS time
        /// </summary>
        public DateTime GpsTime { get; }
        /// <summary>
        /// UTC Time
        /// </summary>
        public DateTime UtcTime { get; }
        /// <summary>
        /// Number of used satellites
        /// </summary>
        public int NumberSatellites { get; }
        /// <summary>
        /// Number of tracked satellites
        /// </summary>
        public int NumberTrackedSatellites { get; }
        /// <summary>
        /// Number of static epochs
        /// </summary>
        public int StaticEpochs { get; }
        /// <summary>
        /// Current age of the correction data in seconds
        /// </summary>
        public double CorrectionAge { get; }
        /// <summary>
        /// Current received correction data sum in bytes
        /// </summary>
        public long ReceivedCorrectionData { get; }
        /// <summary>
        /// Get current RTCM station ID
        /// </summary>
        public int StationID { get; }
        /// <summary>
        /// Is a datum transformation applied?
        /// </summary>
        public bool DatumTransformationApplied { get; }
        /// <summary>
        /// Source reference frame of current position
        /// </summary>
        public IReferenceSystem SourceReferenceFrame { get; }
        /// <summary>
        /// Reference frame of current position
        /// </summary>
        public IReferenceSystem ReferenceFrame { get;  }
        /// <summary> 
        /// Elevation above MSL is computed from height above ellipsoid,
        /// using local or global geoid model (GGF file).
        /// </summary>
        public double Elevation { get; }
        /// <summary> 
        /// Local or global geoid model (GGF file).
        /// </summary>
        public string GeoidModel { get; }

        public PositionUpdateArgs(SolutionType solution, double latitude, double longitude, double height, GroundPositionType groundPositionType,
            double heading, double horizontalVelocity, double verticalVelocity,
            double hPrecision, double vPrecision,
            double sigmaSemiMajorAxis, double sigmaSemiMinorAxis, double sigmaOrientation,
            ImuState imuState, double pitch, double roll, double yaw,
            double pitchPrecision, double rollPrecision, double yawPrecision,
            double pdop, double hdop, double vdop,
            DateTime gpsTime, DateTime utcTime, int numberSatellites, int numberTrackedSatellites, int staticEpochs, double correctionAge,
            long receivedCorrectionData,
            int stationId,
            bool datumTransformationApplied, IReferenceSystem sourceReferenceFrame, IReferenceSystem referenceFrame,
			double elevation, string geoidModel)
        {
            Solution = solution;
            Latitude = latitude;
            Longitude = longitude;
            Height = height;
            GroundPositionType = groundPositionType;
            Heading = heading;
            HorizontalVelocity = horizontalVelocity;
            VerticalVelocity = verticalVelocity;
            HorizontalPrecision = hPrecision;
            VerticalPrecision = vPrecision;
            SigmaSemiMajorAxis = sigmaSemiMajorAxis;
            SigmaSemiMinorAxis = sigmaSemiMinorAxis;
            SigmaOrientation = sigmaOrientation;
            InertialMeasurementUnitState = imuState;
            Pitch = pitch;
            Roll = roll;
            Yaw = yaw;
            PitchPrecision = pitchPrecision;
            RollPrecision = rollPrecision;
            YawPrecision = yawPrecision;
            Pdop = pdop;
            Hdop = hdop;
            Vdop = vdop;
            GpsTime = gpsTime;
            UtcTime = utcTime;
            NumberSatellites = numberSatellites;
            NumberTrackedSatellites = numberTrackedSatellites;
            StaticEpochs = staticEpochs;
            CorrectionAge = correctionAge;
            ReceivedCorrectionData = receivedCorrectionData;
            StationID = stationId;
            DatumTransformationApplied = datumTransformationApplied;
            SourceReferenceFrame = sourceReferenceFrame;
            ReferenceFrame = referenceFrame;
            Elevation = elevation;
            GeoidModel = geoidModel;
        }
    }
}