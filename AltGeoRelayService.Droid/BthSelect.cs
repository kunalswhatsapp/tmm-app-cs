using System;
using System.Collections.Generic;
using Android.App;
using Android.Bluetooth;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Android.Views;
using Android.Widget;
using Button = Android.Widget.Button;
using ListView = Android.Widget.ListView;
using View = Android.Views.View;

namespace AltGeoRelayService.Droid
{
    [Activity(Label = "BTSelectActivity", Theme = "@android:style/Theme.Holo.Light", ScreenOrientation = ScreenOrientation.Portrait)]
    public class BTSelectActivity : Activity
    {
        private Button _btnPaired;
        private ToggleButton _btnScan;
        private ListView _listBtDevices;
        private BluetoothAdapter _adapter;
        private BluetoothReceiver _bluetoothReceiver;
        BthDevListAdapter _btDevices;

        private const int RequestEnableBt = 1;
        public const  string BluetoothDevice = "BluetoothDevice";

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            SetContentView(Resource.Layout.BthSelect);
            var filter = new IntentFilter();
            filter.AddAction(Android.Bluetooth.BluetoothDevice.ActionFound);
            filter.AddAction(BluetoothAdapter.ActionDiscoveryFinished);
            filter.AddAction(BluetoothAdapter.ActionDiscoveryStarted);
            _bluetoothReceiver = new BluetoothReceiver(OnReceive);
            RegisterReceiver(_bluetoothReceiver, filter);

            _adapter = ((BluetoothManager)GetSystemService(Context.BluetoothService))?.Adapter;

            if (_adapter == null || !_adapter.IsEnabled)
            {
                var enableBtIntent = new Intent(BluetoothAdapter.ActionRequestEnable);
                StartActivityForResult(enableBtIntent, RequestEnableBt);
            }
            else
            {
                _adapter.StartDiscovery();
            }

            _btDevices = new BthDevListAdapter(this, Android.Resource.Layout.SimpleExpandableListItem1);

            

            ((TextView)FindViewById(Resource.Id.TextViewBTSelect)).Text = "Select Bluetooth device";

            _btnPaired = (Button)FindViewById(Resource.Id.ButtonBTPaired);
            _btnScan = (ToggleButton)FindViewById(Resource.Id.ToggleButtonBTSelect);
            _listBtDevices = (ListView)FindViewById(Resource.Id.ListViewBTSelect);

            _listBtDevices.Adapter = _btDevices;
            _btnPaired.Click += _btnPaired_Click;
            _btnScan.Click += _btnScan_Click;
            _listBtDevices.ItemClick += _listBTDevices_ItemClick;
        }

        private void _btnPaired_Click(object sender, EventArgs e)
        {
            if (_adapter.IsDiscovering)
            {
                _adapter.CancelDiscovery();
            }

            _btDevices.Clear();
            foreach (var dev in _adapter.BondedDevices)
            {
                _btDevices.Add(dev);
            }
        }

        void _listBTDevices_ItemClick(object sender, AdapterView.ItemClickEventArgs e)
        {
            if (_adapter.IsDiscovering)
            {
                _adapter.CancelDiscovery();
            }
            var clickedDevice = _btDevices.GetItem(e.Position);
            Intent.PutExtra(BluetoothDevice, clickedDevice);
            SetResult(Result.Ok, Intent);
            Finish();	
        }

        void _btnScan_Click(object sender, EventArgs e)
        {
            var btn = (ToggleButton)sender;
            if (btn.Checked)
            {
                if (!_adapter.IsDiscovering)
                {
                    _btDevices.Clear();
                    _adapter.StartDiscovery();
                }
            }
            else
            {
                if (_adapter.IsDiscovering)
                {
                    _adapter.CancelDiscovery();
                }
            }
        }

        private class BluetoothReceiver : BroadcastReceiver
        {
            private readonly List<BluetoothDevice> _deviceList = new List<BluetoothDevice>();

            private readonly Action<BluetoothReceiver, Context, Intent> _receive;

            protected internal BluetoothReceiver(Action<BluetoothReceiver, Context, Intent> receive)
            {
                _receive = receive;
            }

            public override void OnReceive(Context context, Intent intent)
            {
                _receive(this,context,intent);
            }
        }

        private class BthDevListAdapter : ArrayAdapter<BluetoothDevice>
        {
            protected internal BthDevListAdapter(Context context, int textViewResourceId)
                : base(context, textViewResourceId)
            {
            }

            public override View GetView(int position, View convertView, ViewGroup parent)
            {
                var layoutInflater = LayoutInflater.FromContext(parent.Context);
                var row = (TextView)convertView ??
                          (TextView)layoutInflater.Inflate(Android.Resource.Layout.SimpleExpandableListItem1, null);

                var device = GetItem(position);
                var text = String.Format("{0}  ->  {1}", device.Name, device.Address);
                row.Text = text;
                return row;
            }
        }

        private void OnReceive(BluetoothReceiver bluetoothReceiver, Context context, Intent intent)
        {
            var action = intent.Action;
            if (action == Android.Bluetooth.BluetoothDevice.ActionFound)
            {
                var device = (BluetoothDevice)intent.GetParcelableExtra(Android.Bluetooth.BluetoothDevice.ExtraDevice);
                _btDevices.Add(device);
            }
            else if (BluetoothAdapter.ActionDiscoveryFinished == action )
            {
                if (_btnScan.Checked)
                {
                    _btnScan.Checked = false;
                }
            }
            else if (BluetoothAdapter.ActionDiscoveryStarted == action)
            {
                if (!_btnScan.Checked)
                {
                    _btnScan.Checked = true;
                }
            }
        }

        protected override void OnDestroy()
        {
            base.OnDestroy();
            if (_adapter.IsDiscovering)
            {
                _adapter.CancelDiscovery();
            }
            UnregisterReceiver(_bluetoothReceiver);
        }
    }
}