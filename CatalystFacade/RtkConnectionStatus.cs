using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CatalystFacade
{
    public enum RtkConnectionStatus
    {
        
         /// <summary>
         /// Starting NTRIP.
         /// </summary>
        StartingNTRIP,

        /// <summary>
        /// Waiting for correction data.
        /// </summary>
        WaitingCorrectiondata,

        /// <summary>
        /// NTRIP is running.
        /// </summary>
        NTRIPRunning,

        /// <summary>
        /// Starting RTX Via IP.
        /// </summary>
        StartingRTXViaIP,

        /// <summary>
        ///RTX Via IP is running.
        /// </summary>
        RTXViaIPRunning,

        /// <summary>
        /// Starting RTX via satellite.
       /// </summary>
        StartingRTXViaSatellite,

        /// <summary>
        /// RTX via satellite is running.
        /// </summary>
        RTXViaSatelliteRunning
    }

}
