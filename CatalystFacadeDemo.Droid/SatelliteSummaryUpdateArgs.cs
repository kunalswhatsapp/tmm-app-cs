using System;
using System.Collections.Generic;

namespace CatalystFacadeDemo.Droid
{
    internal class SatelliteSummary
    {
        public char Type;
        public int Used;
        public int Tracked;

        internal SatelliteSummary(char type)
        {
            Type = type;
            Used = 0;
            Tracked = 0;
        }
    }
    internal class SatelliteSummaryUpdateArgs : EventArgs
    {
        

        public SatelliteSummaryUpdateArgs(Dictionary<string, SatelliteSummary> satelliteSummaries)
        {
            SatelliteSummaries = satelliteSummaries;
        }


        public Dictionary<string, SatelliteSummary> SatelliteSummaries { get; }
    }
}