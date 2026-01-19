using System;
using Trimble.Ssi.Connection;

namespace CatalystFacade
{
    public class SensorStateEventArgs : EventArgs
    {
        public SensorStateEventArgs(ConnectionState sensorState)
        {
            SensorState = sensorState;
        }

        public ConnectionState SensorState { get; private set; }
    }
}