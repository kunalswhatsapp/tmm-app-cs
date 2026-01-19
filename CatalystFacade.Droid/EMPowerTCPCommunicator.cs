using System;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using Android.Content;
using Android.Util;
using Java.IO;
using Trimble.Ssi.Connection;
using SocketType = System.Net.Sockets.SocketType;
using Trimble.Empower.Common;
using Trimble.Empower.Manager;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CatalystFacade.Droid
{
    class EMPowerTCPCommunicator : ITCPCommunicator
    {
        public EventHandler<MessageReceivedArgs> MessageReceived { get; set; }
        private ConnectionState _connectionState;
        public event EventHandler<ConnectionStateChangedEventArgs> ConnectionStateChanged;

        public bool UseSSL
        {
            get => false;
            set => throw new NotImplementedException();
        }

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

        public string IpAddress { get; set; }
        public int Port { get; set; }


        private Socket _socket = null;
        private Thread _tcpListenerThread = null;
        private volatile bool _tcpListenerThreadCanceled = true;
        private bool _cancelled;

        private ModuleManager _moduleManager = null;
        private ManualResetEvent _event = new ManualResetEvent(false);
        private readonly CatalystFacade _catalystFacade;


        public EMPowerTCPCommunicator(CatalystFacade catalystFacade)
        {
            _catalystFacade = catalystFacade;
        }

        ~EMPowerTCPCommunicator()
        {
            _catalystFacade.LogDebug("TCPCommunication", "~ Destruction");
        }

        
        private static string FindGnss(Dictionary<string, string> properties)
        {
            try
            {
                if (!properties.TryGetValue("Class", out string classType))
                    return null;

                if (string.Compare(classType.ToLower(), "gnss") != 0)
                    return null;

                if (!properties.TryGetValue("Product", out string productShortName) || string.IsNullOrEmpty(productShortName))
                    return null;

                properties.TryGetValue("Capabilities", out string capabilities);
                properties.TryGetValue("Resources", out string resources);

                if (!int.TryParse(resources, out int resourceCount) || resourceCount == 0)
                    return null;

                string resourceIndex;

                string resourceType;
                string resourceName;
                string resourceState;
                string resourceUri;

                for (int index = 0; index < resourceCount; ++index)
                {
                    resourceIndex = string.Format("Resource.{0}.", index + 1);

                    if (!properties.TryGetValue(resourceIndex + "Type", out resourceType))
                        continue;

                    if (resourceType != "1")
                        continue;

                    if (!properties.TryGetValue(resourceIndex + "State", out resourceState))
                        continue;

                    if (resourceState != "1")
                        continue;

                    if (!properties.TryGetValue(resourceIndex + "Name", out resourceName))
                        continue;

                    if (!properties.TryGetValue(resourceIndex + "Uri", out resourceUri))
                        continue;

                    return resourceUri;
                }
            }
            catch (Exception)
            {
            }
            return null;
        }

        private void OnModuleManagerApiAvailable(object sender, EventArgs eventArgs)
        {
            // just use the first found gnss receiver
            string found_address = null;
            for (uint i = 0; i < _moduleManager.ModuleBayCount; i++)
            {
                var moduleStatus = _moduleManager.GetModuleStatus(i);
                if (moduleStatus.Ready && moduleStatus.DetailedState != ModuleStatus.DetailedState.Busy)
                {
                    var moduleProperties = _moduleManager.GetProperties(i);
                    var address = FindGnss(moduleProperties);
                    if (address != null)
                    {
                        found_address = address;
                        break;
                    }
                }
            }

            if (found_address != null)
            {
                try
                {
                    if (found_address[0] == '[') //ipv6
                    {
                        int ip_end = found_address.IndexOf(']');
                        var ip = found_address.Substring(0, ip_end + 1);
                        int port_start = ip_end + 1;
                        var port = found_address.Substring(port_start + 1);

                        IpAddress = ip;
                        Port = int.Parse(port);
                    }
                    else //ipv4
                    {
                        int ip_end = found_address.IndexOf(':');
                        var ip = found_address.Substring(0, ip_end);
                        var port = found_address.Substring(ip_end + 1);

                        IpAddress = ip;
                        Port = int.Parse(port);
                    }
                }
                catch (Exception e)
                {
                    _catalystFacade.LogDebug("TCPCommunication", String.Format("Parse address error: {0}", e.Message));
                }
            }
            _event.Set();

        }

        private bool FindEMPowerGnss()
        {
            _event.Reset();

            Task.Run(() => {
                _moduleManager = ModuleManager.Instance;
                if (_moduleManager != null)
                {
                    _moduleManager.APIAvailable += OnModuleManagerApiAvailable;
                    if (_moduleManager.IsAPIAvailable())
                    {
                        OnModuleManagerApiAvailable(this, null);
                    }
                }
            });

            _event.WaitOne(3000);

            if (_moduleManager != null)
            {
                _moduleManager.APIAvailable -= OnModuleManagerApiAvailable;
            }

            if (string.IsNullOrEmpty(IpAddress) || Port <= 0)
            {
                return false;
            }

            return true;
        }

        public bool Connect()
        {
            if (!FindEMPowerGnss())
            {
                return false;
            }

            if (!ConnectSocket())
            {
                return false;
            }

            return true;
        }

        private bool ConnectSocket()
        {
            _catalystFacade.LogDebug("TCPCommunication", "connect()");
            try
            {
                try
                {
                    _catalystFacade.LogDebug("TCPCommunication", String.Format("Socket {0}:{1}", IpAddress, Port));
                    _socket = new Socket(SocketType.Stream, ProtocolType.Tcp);
                    var hostAddresses = Dns.GetHostAddresses(IpAddress);
                    foreach (var address in hostAddresses)
                    {
                        _catalystFacade.LogDebug("TCPCommunication", $"Address:{address}" );
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
                    _catalystFacade.LogError("TCPCommunication", $"Exception:{ e.Message}");
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
            _event.Set();
            Disconnect();
            return true;
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
                    ConnectionState = ConnectionState.LinkDown;
                }
            }
            catch (Exception e)
            {
                _catalystFacade.LogDebug("TCPCommunication", e.Message);
                if (!_tcpListenerThreadCanceled)
                {
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