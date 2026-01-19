using System;

namespace CatalystFacade
{
    public class RtkConnectionStatusArgs : EventArgs
    {
        public RtkConnectionStatusArgs(RtkConnectionStatus rtkConnectionStatus)
        {
            RtkConnectionStatus = rtkConnectionStatus;
        }

        public RtkConnectionStatus RtkConnectionStatus { get;private set; }
    }
}