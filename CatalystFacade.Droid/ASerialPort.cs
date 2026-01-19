using System.Runtime.InteropServices;

namespace CatalystFacade.Droid
{
    class ASerialPort
    {
        private int _handle;
        private const string LibName = "ASerialPort";
        static ASerialPort()
        {
            try
            {
                Java.Lang.JavaSystem.LoadLibrary(LibName);
            }
            catch (Java.Lang.UnsatisfiedLinkError ex)
            {
                ex.PrintStackTrace();
            }
        }

        public ASerialPort()
        {
            _handle = -1;
        }

        public static bool Readcfg(string device, byte[] buffer)
        {
            return aSerialPort_readcfg(device, buffer, buffer.Length);
        }

        public static bool Writecfg(string device, byte[] buffer)
        {
            return aSerialPort_writecfg(device, buffer, buffer.Length);
        }

        public bool OpenPort(string device, int baudrate)
        {
            _handle = aSerialPort_open(device, baudrate);
            return (_handle != -1);
        }

        public void ClosePort()
        {
            if(_handle != -1)
            {
                aSerialPort_close(_handle);
                _handle = -1;
            }
        }

        public int ReadPort(byte[] buffer)
        {
            if(_handle != -1)
                return aSerialPort_read(_handle, buffer, buffer.Length);
            return -1;
        }

        public int WritePort(byte[] buffer, int length)
        {
            if (_handle != -1)
                return aSerialPort_write(_handle, buffer, length > buffer.Length ? buffer.Length : length);
            return -1;
        }

        [DllImport(LibName)]
        private static extern bool aSerialPort_readcfg(string device, byte[] buffer, int cfg_length);

        [DllImport(LibName)]
        private static extern bool aSerialPort_writecfg(string device, byte[] buffer, int cfg_length);

        [DllImport(LibName)]
        private static extern int aSerialPort_open(string device, int baudrate);

        [DllImport(LibName)]
        private static extern void aSerialPort_close(int handle);

        [DllImport(LibName)]
        private static extern int aSerialPort_read(int handle, byte[] buffer, int size);

        [DllImport(LibName)]
        private static extern int aSerialPort_write(int handle, byte[] buffer, int length);
    }
}