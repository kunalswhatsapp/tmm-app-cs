using Android;
using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Android.Text;
using Android.Util;
using Android.Views;
using Android.Widget;
using CatalystFacade;
using CatalystFacade.Droid;
using System;
using System.Collections.Generic;
using System.Globalization;
using Trimble.Ssi.Components.Core.Formats;
using Xamarin.Essentials;

namespace AltGeoRelayService.Droid
{
    [Activity(Label = "@string/ApplicationName", MainLauncher = true, Icon = "@drawable/map_marker")]
    public class MainActivity : CatalystFacadeActivity
    {
        private UnitsAngle _angleUnits = new UnitsAngle(AngleTypes.Deg, 8);
        private Dialog _progressDialog;
        private bool _shownConnectedHint;
        private Button _btnRelayService;
        private TextView _txtLastApiPayload;
        private TextView _txtLastApiResponse;
        private TextView _txtLastApiStatus;

        private static readonly int LocalSettingsRequest = GetUniqueRequestCode();
        private static readonly int RequestLogin = GetUniqueRequestCode();
        private static readonly int CheckOnDemand = GetUniqueRequestCode();
        private static readonly int ChangeCorrectionSourceSettings = GetUniqueRequestCode();
        private static readonly int RequestCriticalPermissionsRequest = GetUniqueRequestCode();

        public override string AppGuid => MainModel.AppGuid;

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            Xamarin.Essentials.Platform.Init(this, bundle);

            // Set our view from the "main" layout resource
            SetContentView(Resource.Layout.Main);

            var toolbar = FindViewById<Toolbar>(Resource.Id.Toolbar);
            SetActionBar(toolbar);

            _btnRelayService = FindViewById<Button>(Resource.Id.btnRelayService);
            if (_btnRelayService != null)
            {
                _btnRelayService.Click += (s, e) => ToggleRelayService();
                UpdateRelayButtonText();
            }

            List<string> criticalPermissions = new List<string> {
                Manifest.Permission.Internet,
                Manifest.Permission.AccessNetworkState,
                Manifest.Permission.AccessFineLocation,
                Manifest.Permission.Bluetooth,
                Manifest.Permission.ReadPhoneState,
                Manifest.Permission.ChangeNetworkState
            };
            if (Android.OS.Build.VERSION.SdkInt >= Android.OS.BuildVersionCodes.M)
            {
                if (Android.OS.Build.VERSION.SdkInt >= Android.OS.BuildVersionCodes.S)
                {
                    criticalPermissions.AddRange(new string[] { Manifest.Permission.BluetoothConnect, Manifest.Permission.BluetoothScan });
                }
                else
                {
                    criticalPermissions.Add(Manifest.Permission.WriteExternalStorage);
                }

                List<string> neededCriticalPermissions = new List<string>();
                foreach (var criticalPermission in criticalPermissions)
                {
                    var permission = CheckSelfPermission(criticalPermission);
                    if (permission == Android.Content.PM.Permission.Denied)
                        neededCriticalPermissions.Add(criticalPermission);
                }

                if (neededCriticalPermissions.Count != 0)
                {
                    RequestPermissions(neededCriticalPermissions.ToArray(),
                         RequestCriticalPermissionsRequest);
                }
                else
                {
                    MainModel.Instance.ReceivedPermissions();
                }
            }
            else
            {
                MainModel.Instance.ReceivedPermissions();
            }
            MainModel.Instance.LicenseStatusHandler += (sender, args) =>
            {
                RunOnUiThread(() =>
                {
                    UpdateStatus(FindViewById<LinearLayout>(Resource.Id.layoutLicStatus),
                                FindViewById<TextView>(Resource.Id.txtLicStatus), args);
                    
                });
            };
            MainModel.Instance.SensorStatusHandler += (sender, args) =>
            {
                RunOnUiThread(() =>
                {
                    UpdateStatus(FindViewById<LinearLayout>(Resource.Id.layoutSensorStatus),
                                FindViewById<TextView>(Resource.Id.txtSensorStatus), args);

                    // Common confusion: Connect just links to the receiver; position fields populate
                    // only once a survey is started (and subscription is loaded if required).
                    if (!_shownConnectedHint &&
                        args != null &&
                        args.ReturnCode == DriverReturnCode.Success &&
                        !string.IsNullOrWhiteSpace(args.Status) &&
                        args.Status.Contains("Connected", StringComparison.OrdinalIgnoreCase))
                    {
                        _shownConnectedHint = true;
                        Toast.MakeText(this, "Connected.", ToastLength.Short).Show();
                    }
                });
            };
            MainModel.Instance.SurveyStatusHandler += (sender, args) =>
            {
                RunOnUiThread(() =>
                {
                    UpdateStatus(FindViewById<LinearLayout>(Resource.Id.layoutSurveyStatus),
                                FindViewById<TextView>(Resource.Id.txtSurveyStatus), args);
                });
            };

            MainModel.Instance.RtkConnectionStatusHandler += (sender, args) =>
            {
                RunOnUiThread(() =>
                {
                    var rtkStatus = "";

                    if (args?.Status != null)
                    {
                        rtkStatus = args.Status;
                    }
                    FindViewById<TextView>(Resource.Id.txtRtkConnectionStatusValue).Text = rtkStatus;
                });
                System.Threading.Tasks.Task.Run(UpdateExternalReceiverBatteryLevel);
            };

            MainModel.Instance.SurveyTypeHandler += (sender, args) =>
            {
                RunOnUiThread(() =>
                {
                    var surveyType = "";

                    if (args?.Status != null)
                    {
                        surveyType = args.Status;
                    }
                    FindViewById<TextView>(Resource.Id.txtRtkSurveyTypeValue).Text = surveyType;
                });
            };
            MainModel.Instance.PositionUpdateHandler += (sender, args) =>
            {
                RunOnUiThread(() =>
                {
                    if (args == null)
                    {
                        ResetPositionTable();
                        return;
                    }
                    UpdatePositionTable(args);
                });
            };

            MainModel.Instance.SatelliteSummaryUpdateHandler += (sender, args) =>
            {
                RunOnUiThread(() => { UpdateSatelliteSummary(args); });
            };

            FindViewById<Button>(Resource.Id.btnLoadSubscription).Click += (sender, args) =>
            {
                if (MainModel.Instance.UsedSubscriptionType == MainModel.SubscriptionTypes.User)
                {
                    Intent loginIntent = new Intent("com.trimble.tmm.LOGIN");
                    loginIntent.PutExtra("applicationID", MainModel.AppGuid);
                    loginIntent.PutExtra("receiverName", MainModel.Instance.GetConfiguredReceiverName());
                    loginIntent.PutExtra("noInstall", !MainModel.Instance.IsCatalystDA1Selected());
                    StartActivity(loginIntent, RequestLogin);
                }
                else if (MainModel.Instance.UsedSubscriptionType == MainModel.SubscriptionTypes.Device)
                {
                    MainModel.Instance.BeginLoadSubcription("");
                }
                else
                {
                    MainModel.Instance.BeginLoadSubcription("");
                }
            };
            FindViewById<Button>(Resource.Id.btnCheckOnDemand).Click += (sender, args) =>
            {
                Intent onDemandIntent = new Intent("com.trimble.tmm.ONDEMAND");
                onDemandIntent.PutExtra("applicationID", MainModel.AppGuid);
                StartActivity(onDemandIntent, CheckOnDemand);
            };
            FindViewById<Button>(Resource.Id.btnConnect).Click += (sender, args) =>
            {
                MainModel.Instance.BeginConnect();
            };
            FindViewById<Button>(Resource.Id.btnDisconnect).Click += (sender, args) =>
            {
                MainModel.Instance.BeginDisconnect();
            };
            FindViewById<Button>(Resource.Id.btnGetNtripSourceList).Click += (sender, args) =>
            {
                MainModel.Instance.BeginGetNtripSource(HideProgress);
            };
            FindViewById<Button>(Resource.Id.btnChangeCorrectionSourceSettings).Click += (sender, args) =>
            {
                if (MainModel.Instance.CurrentUser == null)
                {
                    AlertDialog.Builder alert = new AlertDialog.Builder(this);
                    alert.SetTitle("TMM Correction Source");
                    alert.SetMessage("TMM Subscription needed.");

                    Dialog dialog = alert.Create();
                    dialog.Show();
                }
                RequestLocalSettingsFromTMM( exception =>
                {
                    RunOnUiThread(() =>
                    {
                        if (exception == null)
                        {
                            AlertDialog.Builder alert = new AlertDialog.Builder(this);
                            alert.SetTitle("TMM Correction Source");
                            alert.SetMessage("Correction Source Successfully imported.");

                            Dialog dialog = alert.Create();
                            dialog.Show();
                        }
                        else if (exception is ArgumentNullException)
                        {
                            // if user cancels show nothing
                        }
                        else
                        {
                            AlertDialog.Builder alert = new AlertDialog.Builder(this);
                            alert.SetTitle("TMM Correction Source");
                            alert.SetMessage($"Correction Source import failed.{exception.Message}");
                            Log.Error("AltGeoRelayService", $"Importing TMM Correction Source:{exception.Message}:{exception.StackTrace}");
                            Dialog dialog = alert.Create();
                            dialog.Show();
                        }
                    });

                });
            };
            FindViewById<Button>(Resource.Id.btnStartSurvey).Click += (sender, args) =>
            {
                FindViewById<Switch>(Resource.Id.switchGoStatic).Checked = false;
                MainModel.Instance.BeginStartSurvey();
            };
            FindViewById<Button>(Resource.Id.btnEndSurvey).Click += (sender, args) =>
            {
                MainModel.Instance.BeginEndSurvey();
            };

            FindViewById<Button>(Resource.Id.btnMarkPoints).Click += (sender, args) =>
            {
                ShowInputPointNameDialog();
            };
            FindViewById<Button>(Resource.Id.btnClearMarking).Click += (sender, args) =>
            {
                MainModel.Instance.ClearMarking();
                FindViewById<TextView>(Resource.Id.txtMarker).Text = "";
            };
            FindViewById<Switch>(Resource.Id.switchGoStatic).CheckedChange += (sender, args) =>
            {
                MainModel.Instance.GoStatic(((Switch)sender).Checked);
            };

            // Initialize API data display
            _txtLastApiPayload = FindViewById<TextView>(Resource.Id.txtLastApiPayload);
            _txtLastApiResponse = FindViewById<TextView>(Resource.Id.txtLastApiResponse);
            _txtLastApiStatus = FindViewById<TextView>(Resource.Id.txtLastApiStatus);

            // Subscribe to API data updates
            DeviceLogRelayService.ApiDataUpdated += OnApiDataUpdated;

            // Load initial API data if available
            UpdateApiDataDisplay();
        }

        private void UpdateApiDataDisplay(string payload = null, string response = null, string status = null)
        {
            if (payload == null || response == null || status == null)
            {
                var (lastPayload, lastResponse, lastStatus) = DeviceLogRelayService.GetLastApiData();
                payload = lastPayload;
                response = lastResponse;
                status = lastStatus;
            }

            if (_txtLastApiPayload != null)
            {
                _txtLastApiPayload.Text = payload;
            }
            if (_txtLastApiResponse != null)
            {
                _txtLastApiResponse.Text = response;
            }
            if (_txtLastApiStatus != null)
            {
                _txtLastApiStatus.Text = status;
            }
        }

        private void UpdateExternalReceiverBatteryLevel()
        {
            // wait short delay after connection was established to prevent racing condition
            System.Threading.Thread.Sleep(5000);

            RunOnUiThread(() =>
            {
                string batteryLevel = (MainModel.Instance.GetExternalReceiverBatteryLevel() > 0)
                   ? MainModel.Instance.GetExternalReceiverBatteryLevel().ToString() + "%"
                   : string.Empty;

                FindViewById<TextView>(Resource.Id.txtExternalReceiverBatteryLevelValue).Text = batteryLevel;
            });            
        }


        private void StartActivity(Intent intent, int requestCode)
        {
            try
            {
                StartActivityForResult(intent, requestCode);
            }
            catch (ActivityNotFoundException)
            {
                RunOnUiThread(() => Toast.MakeText(ApplicationContext, "Install Trimble Mobile Manager ", ToastLength.Long).Show());
            }
        }

        private void ResetPositionTable()
        {
            FindViewById<TextView>(Resource.Id.txtSolutionType).Text = "";
            FindViewById<TextView>(Resource.Id.txtLatitude).Text = "";
            FindViewById<TextView>(Resource.Id.txtLongitude).Text = "";
            FindViewById<TextView>(Resource.Id.txtHeight).Text = "";
            FindViewById<TextView>(Resource.Id.txtGroundPositionType).Text = "";
            FindViewById<TextView>(Resource.Id.txtHPrecision).Text = "";
            FindViewById<TextView>(Resource.Id.txtVPrecision).Text = "";
            FindViewById<TextView>(Resource.Id.txtSigmaSemiMajorAxis).Text = "";
            FindViewById<TextView>(Resource.Id.txtSigmaSemiMinorAxis).Text = "";
            FindViewById<TextView>(Resource.Id.txtSigmaOrientation).Text = "";
            FindViewById<TextView>(Resource.Id.txtIMUState).Text = "";
            FindViewById<TextView>(Resource.Id.txtPitch).Text = "";
            FindViewById<TextView>(Resource.Id.txtRoll).Text = "";
            FindViewById<TextView>(Resource.Id.txtYaw).Text = "";
            FindViewById<TextView>(Resource.Id.txtPitchPrecision).Text = "";
            FindViewById<TextView>(Resource.Id.txtRollPrecision).Text = "";
            FindViewById<TextView>(Resource.Id.txtYawPrecision).Text = "";
            FindViewById<TextView>(Resource.Id.txtNoOfSatellites).Text = "";
            FindViewById<TextView>(Resource.Id.txtStaticEpoch).Text = "";
            FindViewById<TextView>(Resource.Id.txtCorrectionAge).Text = "";
            FindViewById<TextView>(Resource.Id.txtReceivedCorrectionData).Text = "";
            FindViewById<TextView>(Resource.Id.txtStationID).Text = "";
            FindViewById<TextView>(Resource.Id.txtIsTransformed).Text = "";
            FindViewById<TextView>(Resource.Id.txtSourceReferenceFrame).Text = "";
            FindViewById<TextView>(Resource.Id.txtSourceEpoch).Text = "";
            FindViewById<TextView>(Resource.Id.txtOutputReferenceFrame).Text = "";
            FindViewById<TextView>(Resource.Id.txtOutputEpoch).Text = "";
            FindViewById<TextView>(Resource.Id.txtElevation).Text = "";
            FindViewById<TextView>(Resource.Id.txtGeoidModel).Text = "";
            FindViewById<TextView>(Resource.Id.txtGPSTime).Text = "";
            FindViewById<TextView>(Resource.Id.txtUTCTime).Text = "";
        }

        private static string FormatRadsToDegrees(double rad)
        {
            if(double.IsNaN(rad))
            {
                return "NaN";
            }
            double deg = rad * 180 / Math.PI;
            double min = Math.Abs(deg - (int) deg) * 60;
            double sec = Math.Abs(min - (int) min) * 60;

            return $"{(int) deg}°{(int) min}\'{sec:0.####}\"";
        }
        private void UpdatePositionTable(PositionUpdateArgs args)
        {
            FindViewById<TextView>(Resource.Id.txtSolutionType).Text = args.Solution.ToString();
            FindViewById<TextView>(Resource.Id.txtLatitude).Text = FormatRadsToDegrees(args.Latitude);
            FindViewById<TextView>(Resource.Id.txtLongitude).Text = FormatRadsToDegrees(args.Longitude);
            FindViewById<TextView>(Resource.Id.txtHeight).Text = Units.Distances.Format(args.Height);
            FindViewById<TextView>(Resource.Id.txtGroundPositionType).Text = args.GroundPositionType.ToString();
            FindViewById<TextView>(Resource.Id.txtHPrecision).Text = Units.StandardDeviations.Format(args.HorizontalPrecision);
            FindViewById<TextView>(Resource.Id.txtVPrecision).Text = Units.StandardDeviations.Format(args.VerticalPrecision);
            FindViewById<TextView>(Resource.Id.txtSigmaSemiMajorAxis).Text = Units.Distances.Format(args.SigmaSemiMajorAxis);
            FindViewById<TextView>(Resource.Id.txtSigmaSemiMinorAxis).Text = Units.Distances.Format(args.SigmaSemiMinorAxis);
            FindViewById<TextView>(Resource.Id.txtSigmaOrientation).Text = FormatRadsToDegrees(args.SigmaOrientation);
            FindViewById<TextView>(Resource.Id.txtIMUState).Text = args.InertialMeasurementUnitState.ToString();
            FindViewById<TextView>(Resource.Id.txtPitch).Text = FormatRadsToDegrees(args.Pitch);
            FindViewById<TextView>(Resource.Id.txtRoll).Text = FormatRadsToDegrees(args.Roll);
            FindViewById<TextView>(Resource.Id.txtYaw).Text = FormatRadsToDegrees(args.Yaw);
            FindViewById<TextView>(Resource.Id.txtPitchPrecision).Text = FormatRadsToDegrees(args.PitchPrecision);
            FindViewById<TextView>(Resource.Id.txtRollPrecision).Text = FormatRadsToDegrees(args.RollPrecision);
            FindViewById<TextView>(Resource.Id.txtYawPrecision).Text = FormatRadsToDegrees(args.YawPrecision);
            FindViewById<TextView>(Resource.Id.txtNoOfSatellites).Text = args.NumberSatellites.ToString() + " / " + args.NumberTrackedSatellites.ToString();
            FindViewById<TextView>(Resource.Id.txtStaticEpoch).Text = args.StaticEpochs.ToString();
            FindViewById<TextView>(Resource.Id.txtCorrectionAge).Text = args.CorrectionAge.ToString(CultureInfo.InvariantCulture);
            FindViewById<TextView>(Resource.Id.txtReceivedCorrectionData).Text = $"{args.ReceivedCorrectionData} bytes";
            FindViewById<TextView>(Resource.Id.txtStationID).Text = $"{args.StationID}";
            FindViewById<TextView>(Resource.Id.txtIsTransformed).Text = args.DatumTransformationApplied ? "Yes" : "No";
            FindViewById<TextView>(Resource.Id.txtSourceReferenceFrame).Text = MainModel.GetReferenceFrameName(args.SourceReferenceFrame);
            FindViewById<TextView>(Resource.Id.txtSourceEpoch).Text = MainModel.GetReferenceFrameEpoch(args.SourceReferenceFrame).ToString(CultureInfo.InvariantCulture);
            FindViewById<TextView>(Resource.Id.txtOutputReferenceFrame).Text = MainModel.GetReferenceFrameName(args.ReferenceFrame);
            FindViewById<TextView>(Resource.Id.txtOutputEpoch).Text = MainModel.GetReferenceFrameEpoch(args.ReferenceFrame).ToString(CultureInfo.InvariantCulture);
            FindViewById<TextView>(Resource.Id.txtElevation).Text = Units.Distances.Format(args.Elevation);
            FindViewById<TextView>(Resource.Id.txtGeoidModel).Text = args.GeoidModel;
            FindViewById<TextView>(Resource.Id.txtGPSTime).Text = args.GpsTime.ToString("O");
            FindViewById<TextView>(Resource.Id.txtUTCTime).Text = args.UtcTime.ToString("O");
        }

        private void UpdateSatelliteSummary(SatelliteSummaryUpdateArgs summary)
        {
            UpdateSatSummary(summary, Resource.Id.txtGpsSummary, "G");

            UpdateSatSummary(summary, Resource.Id.txtGlonassSummary, "R");

            UpdateSatSummary(summary, Resource.Id.txtBeidouSummary, "B");

            UpdateSatSummary(summary, Resource.Id.txtGalileoSummary, "E");

            UpdateSatSummary(summary, Resource.Id.txtSbasSummary, "S");

            UpdateSatSummary(summary, Resource.Id.txtQzssSummary, "Q");

            UpdateSatSummary(summary, Resource.Id.txtIrnssSummary, "I");
        }

        private void UpdateSatSummary(SatelliteSummaryUpdateArgs summary, int txtSummary, string satType)
        {
            if (summary != null && summary.SatelliteSummaries.ContainsKey(satType))
            {
                Dictionary<string, SatelliteSummary> satelliteSummaryDictionary = summary.SatelliteSummaries;
                SatelliteSummary satSummary = satelliteSummaryDictionary[satType];
                var summaryText = $"{satSummary.Used}/{satSummary.Tracked}";
                ((TextView)FindViewById(txtSummary)).Text = summaryText;
            }
            else
            {
                ((TextView)FindViewById(txtSummary)).Text = "0/0";
            }
        }

        private void UpdateStatus(LinearLayout layout, TextView statusTextView, MainModel.StatusUpdateArgs args)
        {
            string batteryLevel = (MainModel.Instance.GetExternalReceiverBatteryLevel() > 0)
                ? MainModel.Instance.GetExternalReceiverBatteryLevel().ToString() + "%"
                : string.Empty;

            FindViewById<TextView>(Resource.Id.txtExternalReceiverBatteryLevelValue).Text = batteryLevel;

            if (args == null)
            {
                layout.Background = GetDrawable(Resource.Drawable.RoundedRectGrey);
                statusTextView.Text = GetString(Resource.String.Status);
                return;
            }

            if (args.ReturnCode == DriverReturnCode.Success)
            {
                layout.Background = GetDrawable(Resource.Drawable.RoundedRectGreen);
            }
            else
            {
                layout.Background = GetDrawable(Resource.Drawable.RoundedRectRed);
            }
            statusTextView.Text =
                $"{args.ReturnCode} : {args.Status ?? args.Status}";

           
        }

        public override bool OnCreateOptionsMenu(IMenu menu)
        {
            MenuInflater.Inflate(Resource.Menu.TopMainMenu, menu);
            return base.OnCreateOptionsMenu(menu);
        }
        public override bool OnOptionsItemSelected(IMenuItem item)
        {
            if (item.ItemId == Resource.Id.menuConfiguration)
            {
                StartActivity(new Intent(this, typeof(Configuration)));
            }
            return base.OnOptionsItemSelected(item);
        }

        protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
        {
            if (requestCode == RequestLogin)
            {
                if (resultCode == Result.Ok)
                {
                    var userTID = data.GetStringExtra("accountTID");
                    MainModel.Instance.BeginLoadSubcription(userTID);
                }
                else
                {
                    MainModel.Instance.BeginLoadSubcription(null);
                }
            }

            else if (requestCode == CheckOnDemand)
            {
                if (resultCode == Result.Ok)
                {

                    var currentClaim = data.GetStringExtra("claimCountdown");
                    MainModel.Instance.SetCurrentClaim(currentClaim);
                }

            }

            base.OnActivityResult(requestCode, resultCode, data);
        }

        private System.IO.FileStream OpenOrOverwriteFile(string filename)
        {
            if (System.IO.File.Exists(filename))
            {
                return System.IO.File.Open(filename, System.IO.FileMode.Truncate);
            }
            else
            {
                return System.IO.File.Create(filename);
            }
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

            if (MainModel.Instance.ProgressMsg != null)
            {
                ShowProgress(MainModel.Instance.ProgressMsg);
            }
            if (MainModel.Instance.LicStatusUpdateArgs != null)
            {
                UpdateStatus(FindViewById<LinearLayout>(Resource.Id.layoutLicStatus),
                                FindViewById<TextView>(Resource.Id.txtLicStatus), MainModel.Instance.LicStatusUpdateArgs);
            }
            if (MainModel.Instance.ClaimStatusUpdateArgs != null)
            {
                UpdateStatus(FindViewById<LinearLayout>(Resource.Id.layoutLicStatus),
                    FindViewById<TextView>(Resource.Id.txtLicStatus), MainModel.Instance.ClaimStatusUpdateArgs);
            }
            if (MainModel.Instance.SensorStatusUpdateArgs != null)
            {
                UpdateStatus(FindViewById<LinearLayout>(Resource.Id.layoutSensorStatus),
                    FindViewById<TextView>(Resource.Id.txtSensorStatus), MainModel.Instance.SensorStatusUpdateArgs);
            }
            if (MainModel.Instance.SurveyStatusUpdateArgs != null)
            {
                UpdateStatus(FindViewById<LinearLayout>(Resource.Id.layoutSurveyStatus),
                    FindViewById<TextView>(Resource.Id.txtSurveyStatus), MainModel.Instance.SurveyStatusUpdateArgs);
            }

            var surveyType = "";

            if (MainModel.Instance.SurveyTypeUpdateArgs?.Status != null)
            {
                surveyType = MainModel.Instance.SurveyTypeUpdateArgs.Status;
            }

            FindViewById<TextView>(Resource.Id.txtRtkSurveyTypeValue).Text = surveyType;

            var rtkStatus = "";

            if (MainModel.Instance.RtkConnectionStatusUpdateArgs?.Status != null)
            {
                rtkStatus = MainModel.Instance.RtkConnectionStatusUpdateArgs.Status;
            }

            FindViewById<TextView>(Resource.Id.txtRtkConnectionStatusValue).Text = rtkStatus;

            if (MainModel.Instance.PositionUpdateArgs != null)
            {
                UpdatePositionTable(MainModel.Instance.PositionUpdateArgs);
            }
            else
            {
                ResetPositionTable();
            }
            UpdateSatelliteSummary(MainModel.Instance.SatelliteSummaryUpdateArgs);

            if (!string.IsNullOrWhiteSpace(MainModel.Instance.PointName))
            {
                var markerText = $"PointName:{MainModel.Instance.PointName}";
                FindViewById<TextView>(Resource.Id.txtMarker).Text = markerText;
            }

            // Update API data display
            UpdateApiDataDisplay();

            base.OnResume();
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

        void ShowProgress(string msg)
        {
            _progressDialog?.Dismiss();
            _progressDialog = ProgressbarFactory.CreateProgressDialog(this, $"{msg}...");
            _progressDialog.Show();
        }


        protected override void OnPause()
        {
            MainModel.Instance.ProgressMsgChanged -= InstanceOnProgressMsgChanged;
            DeviceLogRelayService.ApiDataUpdated -= OnApiDataUpdated;
            HideProgress();
            base.OnPause();
        }

        private void OnApiDataUpdated(object sender, DeviceLogRelayService.ApiDataEventArgs args)
        {
            RunOnUiThread(() =>
            {
                UpdateApiDataDisplay(args.Payload, args.Response, args.Status);
            });
        }


        void HideProgress()
        {
            _progressDialog?.Dismiss();
        }

        protected void ShowInputPointNameDialog()
        {
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            builder.SetTitle("Point Name:");

            EditText input = new EditText(this);
            input.InputType = InputTypes.ClassText;
            builder.SetView(input);
            builder.SetPositiveButton("OK", (sender, args) =>
            {
                MainModel.Instance.MarksPoints(input.Text);
                var markerText = $"PointName:{MainModel.Instance.PointName}";
                FindViewById<TextView>(Resource.Id.txtMarker).Text = markerText;
            });
            builder.SetNegativeButton("Cancel", (sender, args) =>
            {
                var dialog = sender as AlertDialog;
                dialog?.Cancel();
            });
            builder.Show();
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, Permission[] grantResults)
        {

            bool granted = false;
            if (RequestCriticalPermissionsRequest == requestCode)
                // If request is cancelled, the result arrays are empty.
                if (grantResults.Length > 0)
                {
                    granted = true;
                    foreach (var result in grantResults)
                    {
                        if (result == Android.Content.PM.Permission.Denied)
                        {
                            granted = false;
                            break;
                        }
                    }
                }
            if (!granted)
            {
                Toast.MakeText(this, "Failed to get critical permissions!", ToastLength.Long).Show();
                System.Environment.Exit(0);
            }

            MainModel.Instance.ReceivedPermissions();
        }

        private void ToggleRelayService()
        {
            if (DeviceLogRelayService.IsRunning)
            {
                DeviceLogRelayService.Stop();
                RunOnUiThread(() =>
                {
                    Toast.MakeText(this, "Relay stopped.", ToastLength.Short).Show();
                    UpdateRelayButtonText();
                });
                return;
            }

            var existingTenant = Preferences.Get("altgeo_tenantId", string.Empty);
            if (!string.IsNullOrWhiteSpace(existingTenant))
            {
                DeviceLogRelayService.Start(this, existingTenant);
                RunOnUiThread(() =>
                {
                    Toast.MakeText(this, "Relay started (push every 5 minutes).", ToastLength.Short).Show();
                    UpdateRelayButtonText();
                });
                return;
            }

            var input = new EditText(this)
            {
                Hint = "tenantId"
            };

            new AlertDialog.Builder(this)
                .SetTitle("AltGeo Relay")
                .SetMessage("Enter tenantId")
                .SetView(input)
                .SetPositiveButton("Start", (sender, args) =>
                {
                    var tenantId = input.Text?.Trim();
                    if (string.IsNullOrWhiteSpace(tenantId))
                    {
                        Toast.MakeText(this, "tenantId is required.", ToastLength.Short).Show();
                        return;
                    }
                    Preferences.Set("altgeo_tenantId", tenantId);
                    DeviceLogRelayService.Start(this, tenantId);
                    Toast.MakeText(this, "Relay started (push every 5 minutes).", ToastLength.Short).Show();
                    UpdateRelayButtonText();
                })
                .SetNegativeButton("Cancel", (sender, args) => { })
                .Show();
        }

        private void UpdateRelayButtonText()
        {
            if (_btnRelayService == null) return;
            _btnRelayService.Text = DeviceLogRelayService.IsRunning ? "Stop Relay" : "Start Relay";
        }
    }
}


