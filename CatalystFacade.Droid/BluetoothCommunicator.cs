using System;
using System.IO;
using System.Threading;
using Android.App;
using Android.Bluetooth;
using Android.Content;
using Android.Runtime;
using Android.Util;
using Java.IO;
using Java.Util;
using Trimble.Ssi.Connection;
using Console = System.Console;
using IOException = Java.IO.IOException;
using Object = Java.Lang.Object;

namespace CatalystFacade.Droid
{
    public class BluetoothCommunicator : ICommunicator, IDisposable
    {
        private BluetoothAdapter _bluetoothAdapter;
        private BluetoothDevice _bluetoothDevice;
        private BluetoothSocket _bluetoothSocket = null;

        private static readonly UUID BaseUuid = UUID.FromString("00000000-0000-1000-8000-00805F9B34FB");
        private static readonly UUID SppUuid = UUID.FromString("00001101-0000-1000-8000-00805F9B34FB");
        private bool _isConnected;
        private bool _blueToothListenerThreadCanceled;
        private Thread _blueToothListenerThread;
        private Stream _inputStream;
        private Stream _outputStream;
       
        public BluetoothCommunicator(CatalystFacade catalystFacade, BluetoothDevice device)
        {
            _catalystFacade = catalystFacade;
            _bluetoothDevice = device;
            _bluetoothAdapter = ((BluetoothManager) catalystFacade.Context.GetSystemService(Context.BluetoothService))?.Adapter;
        }

        public bool Connect()
        {
            _catalystFacade.LogDebug("BluetoothCommunication", "Connect");
            if (ConnectInsecure())
            {
                return true;
            }
            if (ConnectSecure())
            {
                return true;
            }
            _catalystFacade.LogDebug("BluetoothCommunication", "Retry");
            var result = false;
            try
            {
                CreateRfCommSocket();
                result = ConnectSocket();
            }
            catch (Exception ex)
            {
                _catalystFacade.LogError("BluetoothCommunication", ex.Message);
            }
            return result;
        }

        private bool ConnectSecure()
        {
            bool result = false;
            var uuid = BaseUuid;
            try
            {
                _catalystFacade.LogDebug("BluetoothCommunication", "Connecting with :" + uuid);
                _bluetoothSocket = _bluetoothDevice.CreateRfcommSocketToServiceRecord(uuid);
                _bluetoothAdapter.CancelDiscovery();
                result = ConnectSocket();
            }
            catch (IOException e)
            {
                Log.Error("BluetoothCommunication", e.Message ?? "");

            }
            catch (Exception e)
            {
                Log.Error("BluetoothCommunication", e.Message ?? "");
            }
            return result;
        }

        public bool CancelConnect()
        {
            _cancelled = true;
            return Disconnect();
        }

        public bool Disconnect()
        {
            bool result = false;
            _blueToothListenerThreadCanceled = true;
            if (null != _bluetoothSocket)
            {
                if (_inputStream != null)
                {
                    try
                    {
                        _inputStream.Close();
                    }
                    catch (Exception e)
                    {
                        _catalystFacade.LogDebug("BluetoothCommunication", "Inputstream close:" + e.Message);
                    }
                    _catalystFacade.LogDebug("BluetoothCommunication", "Inputstream closed");
                    _inputStream = null;
                }

                if (_outputStream != null)
                {
                    try
                    {
                        _outputStream.Close();
                    }
                    catch (Exception e)
                    {
                        _catalystFacade.LogDebug("BluetoothCommunication", "Outputstream close:" + e.Message);
                    }
                    _catalystFacade.LogDebug("BluetoothCommunication", "Outputstream closed");
                    _outputStream = null;
                }

                if (_bluetoothSocket != null)
                {
                    try
                    {
                        _bluetoothSocket.Close();
                    }
                    catch (Exception e)
                    {
                        _catalystFacade.LogDebug("BluetoothCommunication", "Bluetoothsocket close:" + e.Message);
                    }
                    _catalystFacade.LogDebug("BluetoothCommunication", "Bluetoothsocket closed");
                    _bluetoothSocket = null;
                }
            }

            try
            {
                _blueToothListenerThread.Join(3000);
                _catalystFacade.LogDebug("BluetoothCommunication", "Listener thread terminated");
                _blueToothListenerThread = null;
                result = true;
            }
            catch (Exception e)
            {
                _catalystFacade.LogError("BluetoothCommunication", e.Message);
            }
            return result;
        }

        public void PushMessage(byte[] message)
        {
            try
            {
                if (_bluetoothSocket != null && _outputStream != null)
                {
                    _outputStream.Write(message, 0, message.Length);
                    _outputStream.Flush();
                }
            }
            catch (IOException e)
            {
                _catalystFacade.LogDebug("BluetoothCommunication", e.Message);
                if (!_blueToothListenerThreadCanceled)
                {
                    Console.WriteLine(e.StackTrace);
                    ConnectionState = ConnectionState.LinkDown;
                }
            }
            catch (Exception e)
            {
                _catalystFacade.LogDebug("BluetoothCommunication", e.Message);
                if (!_blueToothListenerThreadCanceled)
                {
                    Console.WriteLine(e.StackTrace);
                    ConnectionState = ConnectionState.LinkDown;
                }
            }

        }

        public EventHandler<MessageReceivedArgs> MessageReceived { get; set; }
        public event EventHandler<ConnectionStateChangedEventArgs> ConnectionStateChanged;
        private ConnectionState _connectionState;
        private bool _cancelled;
        private CatalystFacade _catalystFacade;

        public ConnectionState ConnectionState
        {
            get
            {
                return _connectionState;
            }
            private set
            {
                _connectionState = value;
                ConnectionStateChanged?.Invoke(this, new ConnectionStateChangedEventArgs(null, value));
            }
        }

        private bool ConnectInsecure()
        {
            bool result = false;
            try
            {
                _bluetoothSocket = _bluetoothDevice.CreateInsecureRfcommSocketToServiceRecord(SppUuid);
                _bluetoothAdapter.CancelDiscovery();
                result = ConnectSocket();
            }
            catch (IOException e)
            {
                _catalystFacade.LogError("BluetoothCommunication", e.Message);
            }
            catch (Exception e)
            {
                _catalystFacade.LogError("BluetoothCommunication", e.Message);
            }
            return result;
        }

        private bool ConnectSocket()
        {
            if (_cancelled)
            {
                _catalystFacade.LogDebug("BluetoothCommunication", "Connection Aborted");
                return false;
            }
            _catalystFacade.LogDebug("BluetoothCommunication", "ConnectSocket");
            _bluetoothSocket.Connect();
            _inputStream = _bluetoothSocket.InputStream;
            _outputStream = _bluetoothSocket.OutputStream;
            _isConnected = true;
            _blueToothListenerThreadCanceled = true;
            _blueToothListenerThread = new Thread(ListenerThread);
            _blueToothListenerThreadCanceled = false;
            _blueToothListenerThread.Start();
            _catalystFacade.LogDebug("BluetoothCommunication", "_blueToothListenerThread.Start()");
            return true;
        }

        private void CreateRfCommSocket()
        {
            IntPtr createRfcommSocket = JNIEnv.GetMethodID(_bluetoothDevice.Class.Handle, "createRfcommSocket", "(I)Landroid/bluetooth/BluetoothSocket;");
            IntPtr socket = JNIEnv.CallObjectMethod(_bluetoothDevice.Handle, createRfcommSocket, new JValue(1));
            _bluetoothSocket = Object.GetObject<BluetoothSocket>(socket, JniHandleOwnership.TransferLocalRef);
        }

        private void ListenerThread()
        {
            const int bufferSize = 1024;
            var buffer = new byte[bufferSize];
            _catalystFacade.LogDebug("BluetoothCommunication", "Listener Thread started.");
            while (!_blueToothListenerThreadCanceled)
            {
                if (_blueToothListenerThread.ThreadState == ThreadState.AbortRequested)
                {
                    break;
                }
                try
                {
                    if (_isConnected && null != _inputStream)
                    {
                        var length = _inputStream.Read(buffer, 0, 1024);
                        if (-1 != length)
                        {
                            if (null != MessageReceived)
                            {
                                try
                                {
                                    MessageReceived(this, new MessageReceivedArgs(buffer, length));
                                }
                                catch (Exception e)
                                {
                                    Console.WriteLine(e.StackTrace);
                                    _catalystFacade.LogDebug("BluetoothCommunication", e.Message);
                                }
                            }
                        }
                        else
                        {
                            _catalystFacade.LogDebug("BluetoothCommunication", "InputStream.read = -1");
                            if (!_blueToothListenerThreadCanceled)
                            {
                                ConnectionState = ConnectionState.LinkDown;
                            }
                            break;
                        }
                    }
                    else
                    {
                        break;
                    }
                }
                catch (IOException e)
                {
                    _catalystFacade.LogDebug("BluetoothCommunication", e.Message);
                    if (!_blueToothListenerThreadCanceled)
                    {
                        Console.WriteLine(e.StackTrace);
                        ConnectionState = ConnectionState.LinkDown;
                    }
                    break;
                }
                catch (Exception e)
                {
                    _catalystFacade.LogDebug("BluetoothCommunication", e.Message);
                    if (!_blueToothListenerThreadCanceled)
                    {
                        Console.WriteLine(e.StackTrace);
                        ConnectionState = ConnectionState.LinkDown;
                    }
                    break;
                }
            }
            _catalystFacade.LogDebug("BluetoothCommunication", "Listener loop exited.");
        }

        public void Dispose()
        {
            _catalystFacade.LogDebug("BluetoothCommunication", "Disposed");
        }
    }
}