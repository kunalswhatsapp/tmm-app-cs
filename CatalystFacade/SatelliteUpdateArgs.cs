using System;
using System.Collections.Generic;
using Trimble.Ssi.Interfaces.Gnss.Satellites;

namespace CatalystFacade
{
    public class SatelliteUpdateArgs : EventArgs
    {
        public SatelliteUpdateArgs(List<ISatellite> satellites)
        {
            Satellites = satellites;
        }

        public List<ISatellite>  Satellites { get; private set; }
    }
}