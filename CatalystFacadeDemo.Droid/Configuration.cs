using System;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
using Android.App;
using Android.Content;
using Android.OS;
using Android.Views;
using Android.Widget;
using Android.Bluetooth;
using CatalystFacade;
using CatalystFacade.Droid;
using Xamarin.Essentials;
using Button = Android.Widget.Button;
using Toolbar = Android.Widget.Toolbar;
using Switch = Android.Widget.Switch;

namespace CatalystFacadeDemo.Droid
{
    [Activity(Label = "Configuration")]
    public class Configuration : CatalystFacadeActivity
    {
        private Dialog _progressDialog;
        private Button _btnSearchBth;
        private const string TpsdkLogsZip="TpsdkLogs.zip";

        private const int ChooseBtRequest = 1;
        private const int ExportLogsRequest = 45;

        public override string AppGuid => MainModel.AppGuid;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            SetContentView(Resource.Layout.Configuration);

            var toolbar = FindViewById<Toolbar>(Resource.Id.Toolbar);
            SetActionBar(toolbar);
            ActionBar.Title += ": Configuration";

            var subscriptionTypeAdapter = new ArrayAdapter(this, Android.Resource.Layout.SimpleSpinnerItem);
            Array values = Enum.GetValues(typeof(MainModel.SubscriptionTypes));
            subscriptionTypeAdapter.AddAll(values);
            var spnrSubscriptionType = FindViewById<Spinner>(Resource.Id.spnrSubscriptionType);
            spnrSubscriptionType.Adapter = subscriptionTypeAdapter;

            var deviceTypeAdapter = new ArrayAdapter(this, Android.Resource.Layout.SimpleSpinnerItem);
            values = Enum.GetValues(typeof(DriverType));
            deviceTypeAdapter.AddAll(values);
            var spnrDeviceType = FindViewById<Spinner>(Resource.Id.spnrDriverType);
            spnrDeviceType.Adapter = deviceTypeAdapter;
            spnrDeviceType.ItemSelected += OnDriverTypeChanged;

            var spnrConnectionType = FindViewById<Spinner>(Resource.Id.spnrConnType);
            spnrConnectionType.ItemSelected += OnConnectionTypeChanged;

            var txtDeviceAddress = FindViewById<EditText>(Resource.Id.edtDeviceAddress);
            txtDeviceAddress.LongClick += (sender, args) =>
            {
                ClipboardManager clipboard = (ClipboardManager)GetSystemService(Context.ClipboardService);
                ClipData clip = ClipData.NewPlainText(txtDeviceAddress.Text, txtDeviceAddress.Tag.ToString());
                clipboard.PrimaryClip = clip;
                Toast.MakeText(this, "Copied " + txtDeviceAddress.Tag + " to Clipboard",
                    ToastLength.Short).Show();
            };

            txtDeviceAddress.AfterTextChanged += (sender, args) =>
            {
                txtDeviceAddress.Tag = args.Editable.ToString(); 
                var selectedItem = FindViewById<Spinner>(Resource.Id.spnrConnType).SelectedItem;
                if (selectedItem == null)
                {
                    return;
                }
                var selectedConnectionType = selectedItem.ToString();
                if (Enum.TryParse(selectedConnectionType, out MainModel.ConnectionTypes connection))
                {
                    if (connection == MainModel.ConnectionTypes.Bluetooth && txtDeviceAddress.HasFocus)
                    {
                        string deviceAddress = args.Editable.ToString();
                        Regex regex = new Regex("^([0-9A-Fa-f]{2}:){5}([0-9A-Fa-f]{2})$");
                        if (regex.IsMatch(deviceAddress))
                        {
                            BluetoothAdapter adapter = ((BluetoothManager)GetSystemService(Context.BluetoothService))?.Adapter;
                            String name = adapter.GetRemoteDevice(deviceAddress.ToUpper()).Name;
                            if (string.IsNullOrEmpty(name))
                                return;
                            txtDeviceAddress.Text = name;
                            txtDeviceAddress.Tag = deviceAddress;
                        }
                    }
                }

            };
            
            FindViewById<EditText>(Resource.Id.edtDevicePort);
            _btnSearchBth = FindViewById<Button>(Resource.Id.btnBthSearch);
            _btnSearchBth.Click += OnSearchBthDevice;

            var suveyTypeAdapter = new ArrayAdapter(this, Android.Resource.Layout.SimpleSpinnerItem);
            values = Enum.GetValues(typeof(MainModel.SurveyTypes));
            foreach (var value in values)
            {
                suveyTypeAdapter.Add(value.ToString());
            }

            FindViewById<Spinner>(Resource.Id.spnrSurveyType).Adapter = suveyTypeAdapter;

            var targetReferenceFrameAdapter = new ArrayAdapter(this, Android.Resource.Layout.SimpleSpinnerItem);
            values = Enum.GetValues(typeof(TargetReferenceFrame));
            foreach (var value in values)
            {
                targetReferenceFrameAdapter.Add(value.ToString());
            }

            FindViewById<Spinner>(Resource.Id.spnrTargetReferenceFrame).Adapter = targetReferenceFrameAdapter;

            FindViewById<TextView>(Resource.Id.txtTpsdkVersion).Text =
                "TPSDK Version:" + MainModel.Instance.TpskVersion;
            FindViewById<TextView>(Resource.Id.txtDeviceSerialNumber).Text = MainModel.Instance.HostSerial;

            FindViewById<Button>(Resource.Id.btnInstallRTXSubscription).Click += InstallRTXSubscription_Click;
            FindViewById<Button>(Resource.Id.btnMailLog).Click += MailLog_Click;
            FindViewById<Button>(Resource.Id.btnExportLogs).Click += ExportDriverLogs;
            FindViewById<Button>(Resource.Id.btnOpenFacadeLog).Click += OpenFacadeLog_Click;
            FindViewById<Button>(Resource.Id.btnInstallRTXSubscription).Click += InstallRTXSubscription_Click;
            FindViewById<Button>(Resource.Id.btnGeoidFileChoose).Click += OnChooseGeoidFilePath_Click;

            MainModel.Instance.BeginReadMountPointCache(mountPointCache =>
            {
                ArrayAdapter ntripSourceAdapter;

                if (mountPointCache != null)
                {
                    ntripSourceAdapter = new ArrayAdapter<string>(this, Android.Resource.Layout.SimpleSpinnerItem,
                        mountPointCache);
                }
                else
                {
                    ntripSourceAdapter = new ArrayAdapter<string>(this, Android.Resource.Layout.SimpleSpinnerItem,
                        new[] { GetString(Resource.String.RunGetNtripSourceList) });
                }

                var properties = MainModel.Instance.ReadConfig();
                RunOnUiThread(() =>
                {
                    if (properties != null)
                    {
                        if (!Enum.TryParse(properties.GetProperty(MainModel.SubscriptionType), out MainModel.SubscriptionTypes subscriptionType))
                        {
                            subscriptionType = MainModel.SubscriptionTypes.User; //default
                        }

                        spnrSubscriptionType.SetSelection((int)subscriptionType);

                        FindViewById<Switch>(Resource.Id.switchEnableLogs).Checked = bool.Parse(properties.GetProperty(MainModel.EnableDriverLogs,"true"));

                        if (!Enum.TryParse(properties.GetProperty(MainModel.DriverType), out DriverType driverType))
                        {
                            driverType = DriverType.TrimbleGNSS; //default
                        }

                        spnrDeviceType.SetSelection((int)driverType);
                        UpdateConnectionTypes(driverType);

                        txtDeviceAddress.Text = properties.GetProperty(MainModel.DeviceName);
                        txtDeviceAddress.Tag = properties.GetProperty(MainModel.DeviceAddress);

                        FindViewById<EditText>(Resource.Id.edtDevicePort).Text =
                            properties.GetProperty(MainModel.DevicePortNo);

                        FindViewById<Spinner>(Resource.Id.spnrNtripSource).Adapter = ntripSourceAdapter;

                        FindViewById<EditText>(Resource.Id.edtNtripServer).Text =
                            properties.GetProperty(MainModel.NtripServer);
                        FindViewById<EditText>(Resource.Id.edtNtripPort).Text =
                            properties.GetProperty(MainModel.NtripPort);
                        FindViewById<EditText>(Resource.Id.edtNtripUserName).Text =
                            properties.GetProperty(MainModel.NtripUser);
                        FindViewById<EditText>(Resource.Id.edtNtripPassword).Text =
                            properties.GetProperty(MainModel.NtripPassword);
                        FindViewById<EditText>(Resource.Id.edtTargetReferenceFrameId).Text =
                            properties.GetProperty(MainModel.TargetReferenceFrameId);
                        FindViewById<EditText>(Resource.Id.edtGeoidGridFileFullPath).Text =
                            properties.GetProperty(MainModel.GeoidGridFileFullPath);
                        FindViewById<EditText>(Resource.Id.edtReducedAntennaHght).Text =
                            properties.GetProperty(MainModel.ReducedAntennaHeight);
                        FindViewById<Spinner>(Resource.Id.spnrNtripSource)
                                .SetSelection(mountPointCache != null
                                    ? ntripSourceAdapter.GetPosition(properties.GetProperty(MainModel.NtripSource))
                                    : 0);
                        FindViewById<Spinner>(Resource.Id.spnrSurveyType)
                            .SetSelection(
                                suveyTypeAdapter.GetPosition(properties.GetProperty(MainModel.SurveyType)));
                        FindViewById<Spinner>(Resource.Id.spnrTargetReferenceFrame)
                            .SetSelection(
                                targetReferenceFrameAdapter.GetPosition(properties.GetProperty(MainModel.TargetReferenceFrame)));
                    }
                });
            });

        }

        private void ExportDriverLogs(object sender, EventArgs e)
        {
            Intent intent = new Intent(Intent.ActionCreateDocument);
            intent.AddCategory(Intent.CategoryOpenable);
            intent.SetType("application/zip");
            intent.PutExtra(Intent.ExtraTitle, TpsdkLogsZip);
            StartActivityForResult(intent,ExportLogsRequest);
        }


        private void InstallRTXSubscription_Click(object sender, EventArgs e)
        {
            string optionCode = FindViewById<EditText>(Resource.Id.edtInstallRTXSubscription).Text;

            if (!string.IsNullOrWhiteSpace(optionCode))
            {
                var error = MainModel.Instance.InstallRTXSubscription(optionCode);

                if (!string.IsNullOrWhiteSpace(error))
                {
                    RunOnUiThread(() => Toast.MakeText(ApplicationContext, $"Error: {error}", ToastLength.Long).Show());
                    return;
                }
            }

            var subscriptions = MainModel.Instance.GetRTXSubscriptions();

            RunOnUiThread(() => Toast.MakeText(ApplicationContext, $"RTXSubscriptions: {subscriptions}", ToastLength.Long).Show());
        }

        private void MailLog_Click(object sender, EventArgs e)
        {
            MainModel.Instance.Maillog();
        }

        private void OpenFacadeLog_Click(object sender, EventArgs e)
        {
            MainModel.Instance.OpenFacadeLog();
        }

        private void OnSearchBthDevice(object sender, EventArgs e)
        {
            if (Build.VERSION.SdkInt > BuildVersionCodes.P)
            {
                var locationManager = (Android.Locations.LocationManager)ApplicationContext.GetSystemService(LocationService);
                if (!locationManager.IsLocationEnabled)
                {
                    RunOnUiThread(() => Toast.MakeText(ApplicationContext, "Please enable 'Location' to allow bluetooth scanning.", ToastLength.Long).Show());
                    return;
                }
            }

            var btSelectIntent = new Intent(this, typeof(BTSelectActivity));
            StartActivityForResult(btSelectIntent, ChooseBtRequest);
        }

        private void OnDriverTypeChanged(object sender, AdapterView.ItemSelectedEventArgs e)
        {
            DriverType driverType = (DriverType)Enum.Parse(typeof(DriverType), (string)e.Parent.SelectedItem);
            if (driverType == DriverType.TrimbleGNSS || driverType == DriverType.SpectraPrecision)
            {
                FindViewById(Resource.Id.layoutConnectionType).Visibility = ViewStates.Visible;
                FindViewById(Resource.Id.layoutDevicePort).Visibility = ViewStates.Visible;
                FindViewById(Resource.Id.layoutAddress).Visibility = ViewStates.Visible;
                UpdateConnectionTypes(driverType);
            }
            else
            {
                FindViewById(Resource.Id.layoutConnectionType).Visibility = ViewStates.Gone;
                FindViewById(Resource.Id.layoutDevicePort).Visibility = ViewStates.Gone;
                FindViewById(Resource.Id.layoutAddress).Visibility = ViewStates.Gone;
            }
        }

        private void OnChooseGeoidFilePath_Click(object sender, EventArgs e)
        {
            RunOnUiThread(async () => {
                var pickerResult = await FilePicker.PickAsync(PickOptions.Default);
                if (pickerResult != null)
                {
                    FindViewById<EditText>(Resource.Id.edtGeoidGridFileFullPath).Text = pickerResult.FullPath;
                }
            });
        }

        private void OnConnectionTypeChanged(object sender, AdapterView.ItemSelectedEventArgs e)
        {
            MainModel.ConnectionTypes connectionType = (MainModel.ConnectionTypes)Enum.Parse(typeof(MainModel.ConnectionTypes), (string)e.Parent.SelectedItem);
            var currentConnectionTypeVal = MainModel.Instance.ReadConfig().GetProperty(MainModel.ConnectionType);
            MainModel.ConnectionTypes currentConnectionType = MainModel.ConnectionTypes.Bluetooth;
            if(currentConnectionTypeVal != null)
                currentConnectionType = (MainModel.ConnectionTypes)Enum.Parse(typeof(MainModel.ConnectionTypes),currentConnectionTypeVal );
            if (connectionType != currentConnectionType)
            {
                var deviceAddress = FindViewById<EditText>(Resource.Id.edtDeviceAddress);
                if (deviceAddress != null)
                {
                    deviceAddress.Text = string.Empty;
                    deviceAddress.Tag = string.Empty;
                }

                var devicePort = FindViewById<EditText>(Resource.Id.edtDevicePort);
                if (devicePort != null) devicePort.Text = string.Empty;
            }
           
            switch (connectionType)
            {
                case MainModel.ConnectionTypes.Bluetooth:
                    FindViewById(Resource.Id.layoutDevicePort).Visibility = ViewStates.Gone;
                    FindViewById(Resource.Id.btnBthSearch).Visibility = ViewStates.Visible;
                    break;
                case MainModel.ConnectionTypes.TcpIp:
                    FindViewById(Resource.Id.btnBthSearch).Visibility = ViewStates.Gone;
                    FindViewById(Resource.Id.layoutDevicePort).Visibility = ViewStates.Visible;
                    break;
            }
        }

        private void UpdateConnectionTypes(DriverType driverType)
        {
            var adapter = new ArrayAdapter(this, Android.Resource.Layout.SimpleSpinnerItem);
            if (driverType == DriverType.TrimbleGNSS || driverType == DriverType.SpectraPrecision)
            {
                adapter.Add(MainModel.ConnectionTypes.Bluetooth.ToString());
                if (driverType == DriverType.TrimbleGNSS)
                {
                    adapter.Add(MainModel.ConnectionTypes.TcpIp.ToString());
                }

                FindViewById<Spinner>(Resource.Id.spnrConnType).Adapter = adapter;
                var connectionType = MainModel.Instance.ReadConfig().GetProperty(MainModel.ConnectionType);
                if (connectionType != null)
                    FindViewById<Spinner>(Resource.Id.spnrConnType).SetSelection(adapter.GetPosition(connectionType));
            }

        }

        private void InstanceOnProgressMsgChanged(object sender, MainModel.ProgressMsgChange progressMsgChange)
        {
            RunOnUiThread(() =>
            {
                if (progressMsgChange.Msg != null)
                {
                    ShowProgress(progressMsgChange.Msg);

                }
                else
                {
                    HideProgress();
                }
            });
        }

        public override bool OnCreateOptionsMenu(IMenu menu)
        {
            MenuInflater.Inflate(Resource.Menu.TopConfigMenu, menu);
            return base.OnCreateOptionsMenu(menu);
        }
        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            if (item.ItemId == Resource.Id.menuSave)
            {
                var properties = new Java.Util.Properties();
                properties.SetProperty(MainModel.SubscriptionType, FindViewById<Spinner>(Resource.Id.spnrSubscriptionType).SelectedItem.ToString());
                properties.SetProperty(MainModel.EnableDriverLogs, FindViewById<Switch>(Resource.Id.switchEnableLogs).Checked.ToString());
                properties.SetProperty(MainModel.DriverType, FindViewById<Spinner>(Resource.Id.spnrDriverType).SelectedItem.ToString());
                var selectedConnectionType = FindViewById<Spinner>(Resource.Id.spnrConnType).SelectedItem;
                if (selectedConnectionType != null)
                    properties.SetProperty(MainModel.ConnectionType, selectedConnectionType.ToString());
                var tag = FindViewById<EditText>(Resource.Id.edtDeviceAddress).Tag;
                string deviceAddress = FindViewById<EditText>(Resource.Id.edtDeviceAddress).Text;
                if (tag != null && !string.IsNullOrWhiteSpace(tag.ToString()))
                {
                    deviceAddress = tag.ToString();
                }
                properties.SetProperty(MainModel.DeviceAddress, deviceAddress);
                properties.SetProperty(MainModel.DeviceName, FindViewById<EditText>(Resource.Id.edtDeviceAddress).Text);
                properties.SetProperty(MainModel.DevicePortNo, FindViewById<EditText>(Resource.Id.edtDevicePort).Text);
                properties.SetProperty(MainModel.NtripServer, FindViewById<EditText>(Resource.Id.edtNtripServer).Text);
                properties.SetProperty(MainModel.NtripPort, FindViewById<EditText>(Resource.Id.edtNtripPort).Text);
                properties.SetProperty(MainModel.NtripUser, FindViewById<EditText>(Resource.Id.edtNtripUserName).Text);
                properties.SetProperty(MainModel.NtripPassword, FindViewById<EditText>(Resource.Id.edtNtripPassword).Text);
                properties.SetProperty(MainModel.TargetReferenceFrameId, FindViewById<EditText>(Resource.Id.edtTargetReferenceFrameId).Text);
                properties.SetProperty(MainModel.GeoidGridFileFullPath, FindViewById<EditText>(Resource.Id.edtGeoidGridFileFullPath).Text);
                properties.SetProperty(MainModel.ReducedAntennaHeight, FindViewById<EditText>(Resource.Id.edtReducedAntennaHght).Text);
                var selectedNtripSource = FindViewById<Spinner>(Resource.Id.spnrNtripSource).SelectedItem;
                if (selectedNtripSource != null)
                    properties.SetProperty(MainModel.NtripSource, selectedNtripSource.ToString());
                var selectedSurveyType = FindViewById<Spinner>(Resource.Id.spnrSurveyType).SelectedItem;
                if (selectedSurveyType != null)
                    properties.SetProperty(MainModel.SurveyType, selectedSurveyType.ToString());
                var targetReferenceFrame = FindViewById<Spinner>(Resource.Id.spnrTargetReferenceFrame).SelectedItem;
                if (targetReferenceFrame != null)
                    properties.SetProperty(MainModel.TargetReferenceFrame, targetReferenceFrame.ToString());

                MainModel.Instance.BeginWriteConfig(properties);

                RunOnUiThread(() => Toast.MakeText(ApplicationContext, "Configuration saved.", ToastLength.Long).Show());
            }
            else if (item.ItemId == Resource.Id.menuClear)
            {
                AlertDialog.Builder confirmDialog = new AlertDialog.Builder(this);
                confirmDialog.SetPositiveButton("Yes", (sender, args) =>
                {
                    FindViewById<EditText>(Resource.Id.edtNtripServer).Text = "";
                    FindViewById<EditText>(Resource.Id.edtNtripPort).Text = "";
                    FindViewById<EditText>(Resource.Id.edtNtripUserName).Text = "";
                    FindViewById<EditText>(Resource.Id.edtNtripPassword).Text = "";
                    FindViewById<EditText>(Resource.Id.edtTargetReferenceFrameId).Text = "0";
                    FindViewById<EditText>(Resource.Id.edtGeoidGridFileFullPath).Text = "";
                    FindViewById<EditText>(Resource.Id.edtReducedAntennaHght).Text = "";
                    FindViewById<Spinner>(Resource.Id.spnrNtripSource).SetSelection(0);
                    FindViewById<Spinner>(Resource.Id.spnrSurveyType).SetSelection(0);
                    FindViewById<Spinner>(Resource.Id.spnrTargetReferenceFrame).SetSelection(0);
                    MainModel.Instance.BeginDeleteConfig();
                })
                .SetNegativeButton("No", (sender, args) =>
                {

                })
                .SetMessage("Do you want to clear the configuration?")
                .SetTitle("Delete Configuration");
                confirmDialog.Show();
            }
            return base.OnOptionsItemSelected(item);
        }

        protected override void OnResume()
        {
            MainModel.Instance.ProgressMsgChanged += InstanceOnProgressMsgChanged;

            if (MainModel.Instance.ProgressMsg != null)
            {
                ShowProgress(MainModel.Instance.ProgressMsg);
            }
            else
            {
                HideProgress();
            }

            base.OnResume();
        }


        void ShowProgress(string msg)
        {
            _progressDialog?.Dismiss();
            _progressDialog = ProgressbarFactory.CreateProgressDialog(this, $"{msg}...");
            _progressDialog.Show();
        }


        protected override void OnPause()
        {
            MainModel.Instance.ProgressMsgChanged -= InstanceOnProgressMsgChanged;
            HideProgress();
            base.OnPause();
        }

        void HideProgress()
        {
            _progressDialog?.Dismiss();
        }

        protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
        {
            if (resultCode == Result.Ok)
            {
                switch (requestCode)
                {
                    case ChooseBtRequest:
                        {
                            var device = (BluetoothDevice)data.Extras.GetParcelable(BTSelectActivity.BluetoothDevice);
                            var deviceName = device.Name;
                            FindViewById<EditText>(Resource.Id.edtDeviceAddress).Text = string.IsNullOrWhiteSpace(deviceName) ? device.Address : device.Name;

                            FindViewById<EditText>(Resource.Id.edtDeviceAddress).Tag = device.Address;
                        }
                        break;
                    case ExportLogsRequest:
                        {
                            Android.Net.Uri uri = data?.Data;
                            if( uri != null) {
                                ExportsLogs(uri);
                            }
                        }
                        break;;
                }
            }
            base.OnActivityResult(requestCode, resultCode, data);
        }

        private void ExportsLogs(Android.Net.Uri uri)
        {
            Task.Run(() =>
            {
                ParcelFileDescriptor pfd = this.ContentResolver.OpenFileDescriptor(uri, "w");
                
                int count = MainModel.Instance.Compress(pfd);
                if (count == 0)
                {
                    RunOnUiThread(() =>
                    {
                        new AlertDialog.Builder(this).SetTitle("CatalystFacade").SetMessage("No log files").Create().Show();
                    });
                    return;
                }
                else
                {
                    RunOnUiThread(() =>
                    {
                        new AlertDialog.Builder(this).SetTitle("CatalystFacade").SetMessage($"{count} log files exported").Create().Show();
                    } );
                }
            });
        }
    }
}