using Android.OS;
using System;
using System.Threading;
using Trimble.Ssi.Connection;

namespace CatalystFacade.Droid
{
    class OnboardSerialCommunicator : ICommunicator
    {
        internal enum TrimbleControllerType
        {
            Type_A,
            Type_B
        }

        private readonly CatalystFacade _catalystFacade;
        private readonly TrimbleControllerType _controller;
        private static readonly string DEVICE_PORT3 = "/dev/ttyHSL3";
        private static readonly string DEVICE_PORT1 = "/dev/ttyHSL1";
        private static readonly string DEVICE_UBLOX = "/dev/ttyHSL1";
        private static readonly int DEVICE_BAUDRATE = 115200;

        private static readonly string GPS_DEVICE = "/sys/class/bd_gps/bd_gps/bd_enable";
        private static readonly byte[] CFG_ON = new byte[] { (byte)'1' };
        private static readonly byte[] CFG_OFF = new byte[] { (byte)'0' };
        private static readonly byte[] UBLOX_POWERSAVE = { 0xB5, 0x62, 0x06, 0x04, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x16, 0x74 };

        private ASerialPort _aSerialPort;
        private bool _stopthread;
        private Thread _readThread;
        private byte[] _buffer;

        public OnboardSerialCommunicator(CatalystFacade catalystFacade)
        {
            _controller = TrimbleControllerType.Type_A;

            string maker = Build.Manufacturer.ToLowerInvariant();
            if (maker.Contains("trimble"))
            {
                string device = Build.Device.ToLowerInvariant();

                if (device == "tdc600_2")
                {
                    _controller = TrimbleControllerType.Type_B;                        
                }
                else if (device == "mm60_2")
                {
                    _controller = TrimbleControllerType.Type_B;
                }
            }
            _catalystFacade = catalystFacade;
            _aSerialPort = new ASerialPort();
            _buffer = new byte[65535];
            _devicePath = DEVICE_PORT3;

            if(_controller == TrimbleControllerType.Type_B)
            {
                _devicePath = DEVICE_PORT1;
            }
        }

        private void ReadThread()
        {
            while (!_stopthread)
            {
                int nread = _aSerialPort.ReadPort(_buffer);
                if (nread < 0)
                {
                    break;
                }

                // _catalystFacade.LogDebug("OnboardSerialCommunicator", Encoding.UTF8.GetString(_buffer, 0, nread));

                if (null != MessageReceived)
                {
                    try
                    {
                        MessageReceived(this, new MessageReceivedArgs(_buffer, nread));
                    }
                    catch (Exception e)
                    {
                        _catalystFacade.LogError("OnboardSerialCommunicator", $"Exception:{ e.Message}");
                    }
                }
            }
        }

        public bool Connect()
        {
            if (_controller == TrimbleControllerType.Type_A)
            {
                if (!ASerialPort.Writecfg(GPS_DEVICE, CFG_ON))
                    return false;

            }
                 
            Thread.Sleep(1000);

            if(_controller == TrimbleControllerType.Type_A) 
            { 
                // U-Blox power save
                var uBlox = new ASerialPort();
                if (uBlox.OpenPort(DEVICE_UBLOX, 9600))
                {
                    uBlox.WritePort(UBLOX_POWERSAVE, UBLOX_POWERSAVE.Length);
                    uBlox.ClosePort();
                }                  
            } 
            else if (_controller == TrimbleControllerType.Type_B)
            {
                //TODO: Use the new API (not yet made available) to enable power save mode
            }

            var ret = _aSerialPort.OpenPort(_devicePath, DEVICE_BAUDRATE);

            if (!ret)
                return false;

            _stopthread = true;
            _readThread = new Thread(ReadThread);
            _stopthread = false;
            _readThread.Start();

            return true;
        }

        public bool CancelConnect()
        {
            return Disconnect();
        }

        public bool Disconnect()
        {
            _stopthread = true;
            _aSerialPort.ClosePort();
            if (_controller == TrimbleControllerType.Type_A)
            {
                ASerialPort.Writecfg(GPS_DEVICE, CFG_OFF);
            }

            try
            {
                _readThread.Join();
                _readThread = null;
            }
            catch (Exception)
            {
            }

            return true;
        }

        public void PushMessage(byte[] message)
        {
            int written = _aSerialPort.WritePort(message, message.Length);
            if (written != message.Length)
            {
                _catalystFacade.LogDebug("OnboardSerialCommunicator", "pushMessage failed");
            }
        }

        public EventHandler<MessageReceivedArgs> MessageReceived { get; set; }
        private ConnectionState _connectionState;
        private string _devicePath;
        public event EventHandler<ConnectionStateChangedEventArgs> ConnectionStateChanged;

        public ConnectionState ConnectionState
        {
            get
            {
                return _connectionState;
            }
            private set
            {
                _connectionState = value;
                EventHandler<ConnectionStateChangedEventArgs> handler = ConnectionStateChanged;
                if (handler != null) handler(this, new ConnectionStateChangedEventArgs(null, value));
            }
        }
    }

}