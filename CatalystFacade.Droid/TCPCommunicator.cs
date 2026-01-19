using System;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Threading.Tasks;
using Android.Content;
using Android.Net;
using Android.Util;
using Java.IO;
using Trimble.Ssi.Connection;
using Console = System.Console;
using SocketType = System.Net.Sockets.SocketType;
using TransportType = Android.Net.TransportType;

namespace CatalystFacade.Droid
{
    public class TCPCommunicator : ITCPCommunicator
    {
        public EventHandler<MessageReceivedArgs> MessageReceived { get; set; }
        private ConnectionState _connectionState;
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
                ConnectionStateChanged?.Invoke(this, new ConnectionStateChangedEventArgs(null, value));
            }
        }

        public string IpAddress { get; set; }
        public int Port { get; set; }
        public bool UseSSL
        {
            get => false;
            set => throw new NotImplementedException();
        }

        private Socket _socket = null;
        private Thread _tcpListenerThread = null;
        private volatile bool _tcpListenerThreadCanceled = true;
        private readonly Context _context;
        private bool _cancelled;
        private CatalystFacade _catalystFacade;

        public TCPCommunicator(string tcpIpAddress, int tcpIpPort, CatalystFacade catalystFacade, Context context)
        {
            _catalystFacade = catalystFacade;
            IpAddress = tcpIpAddress;
            Port = tcpIpPort;
            _context = context;
        }

        ~TCPCommunicator()
        {
            _catalystFacade.LogDebug("TCPCommunication", "~ Destruction");
        }

        public bool Connect()
        {
            _catalystFacade.LogDebug("TCPCommunication", "connect()");
            try
            {

                if (!IsNetworkConnected())
                {
                    return false;
                }

                try
                {
                    _catalystFacade.LogDebug("TCPCommunication", String.Format("Socket {0}:{1}", IpAddress, Port));
                    _socket = new Socket(SocketType.Stream, ProtocolType.Tcp);
                    var hostAddresses = Dns.GetHostAddresses(IpAddress);
                    foreach (var address in hostAddresses)
                    {
                        _catalystFacade.LogDebug("TCPCommunication", $"Address:{address}");
                    }
                    if (_cancelled) return false;
                    _socket.Connect(hostAddresses, Port);
                    if (_cancelled)
                    {
                        _socket.Shutdown(SocketShutdown.Both);
                        return false;
                    }
                    var ipEndPoint = _socket.RemoteEndPoint as IPEndPoint;
                    if (ipEndPoint != null) _catalystFacade.LogDebug("TCPCommunication", string.Format("Connected to {0}:{1}", ipEndPoint.Address, ipEndPoint.Port));
                }
                catch (Exception e)
                {
                    _catalystFacade.LogError("TCPCommunication", $"Exception:{e.Message}");
                    return false;
                }
                if (_socket.Connected)
                {
                    _socket.ReceiveTimeout = 15000;
                    _socket.SendTimeout = 15000;
                    _socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.KeepAlive, true);
                    _socket.Blocking = true;
                    _tcpListenerThreadCanceled = true;
                    _tcpListenerThread = new Thread(TcpListenerThread);
                    _tcpListenerThreadCanceled = false;
                    _tcpListenerThread.Start();
                    return true;
                }
            }
            catch (Exception)
            {

            }

            return false;
        }

        public bool CancelConnect()
        {
            _cancelled = true;
            Disconnect();
            return true;
        }

        class NetworkCallback : ConnectivityManager.NetworkCallback
        {
            private readonly TaskCompletionSource<bool> _connectionCheck;

            internal NetworkCallback(TaskCompletionSource<bool> connectionCheck)
            {
                _connectionCheck = connectionCheck;
            }
            public override void OnAvailable(Network network)
            {
                base.OnAvailable(network);
                _connectionCheck.SetResult(true);
            }

            public override void OnLost(Network network)
            {
                base.OnLost(network);
                _connectionCheck.SetResult(false);
            }
        }

        private bool IsNetworkConnected()
        {
            NetworkRequest networkRequest = new NetworkRequest.Builder()
                .AddCapability(NetCapability.Internet)
                .AddTransportType(TransportType.Wifi)
                .AddTransportType(TransportType.Cellular)
                .Build();
            ConnectivityManager cm = (ConnectivityManager)_context.GetSystemService(Context.ConnectivityService);
            TaskCompletionSource<bool> connectionStatus = new TaskCompletionSource<bool>();
            cm.RequestNetwork(networkRequest,new NetworkCallback(connectionStatus));
            return connectionStatus.Task.Result;
        }

        public bool Disconnect()
        {
            _catalystFacade.LogDebug("TCPCommunication", "disconnect()");
            bool result = false;
            _tcpListenerThreadCanceled = true;
            try
            {
                _socket.Shutdown(SocketShutdown.Both);
            }
            catch (Exception e)
            {
                _catalystFacade.LogError("TCPCommunication", $"Exception:{e.Message}");
            }
            if (_socket != null)
            {
                try
                {
                    _socket.Close();
                    _socket = null;
                }
                catch (Exception e)
                {
                    _catalystFacade.LogError("TCPCommunication", $"Exception:{e.Message}");
                }
            }
            try
            {
                _tcpListenerThread.Join(3000);
                _tcpListenerThread = null;
                result = true;
            }
            catch (Exception e)
            {
                _catalystFacade.LogError("TCPCommunication", $"Exception:{e.Message}");
            }

            return result;
        }

        public void PushMessage(byte[] message)
        {
            try
            {
                if (_socket != null && _socket.Connected)
                {
                    _socket.Send(message);
                }
            }
            catch (System.IO.IOException e)
            {
                _catalystFacade.LogDebug("TCPCommunication", e.Message);
                if (!_tcpListenerThreadCanceled)
                {
                    Console.WriteLine(e.StackTrace);
                    ConnectionState = ConnectionState.LinkDown;
                }
            }
            catch (Exception e)
            {
                _catalystFacade.LogDebug("TCPCommunication", e.Message);
                if (!_tcpListenerThreadCanceled)
                {
                    Console.WriteLine(e.StackTrace);
                    ConnectionState = ConnectionState.LinkDown;
                }
            }
        }

        private void TcpListenerThread()
        {
            _catalystFacade.LogDebug("TCPCommunication", "TcpListenerThread()");
            bool first = true;
            var buffer = new byte[1024];
            while (!_tcpListenerThreadCanceled)
            {
                if (first)
                {
                    _catalystFacade.LogDebug("TCPCommunication", "while (!_tcpListenerThreadCanceled)");
                    first = false;
                }

                try
                {

                    if (_socket.Connected)
                    {
                        var available = _socket.Available;
                        if (available > 0)
                        {
                            var length = _socket.Receive(buffer);
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
                                        _catalystFacade.LogDebug("TCPCommunication", e.Message);
                                    }
                                }
                            }
                            else
                            {
                                _catalystFacade.LogDebug("TCPCommunication", "_socket.Receive() == -1");
                                if (!_tcpListenerThreadCanceled)
                                {
                                    ConnectionState = ConnectionState.LinkDown;
                                }
                                break;
                            }
                        }
                    }
                    else
                    {
                        break;
                    }
                }
                catch (Exception e)
                {
                    _catalystFacade.LogDebug("TCPCommunication", $"Exception:{e.Message}");
                    if (!_tcpListenerThreadCanceled)
                    {

                        ConnectionState = ConnectionState.LinkDown;
                    }
                    break;
                }
            }
            if (!_tcpListenerThreadCanceled)
            {

                ConnectionState = ConnectionState.LinkDown;
            }
            _catalystFacade.LogDebug("TCPCommunication", "Listener loop exited.");
        }
    }
}