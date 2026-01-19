using Android.App;
using Android.Content;
using System;
using System.Threading;

namespace CatalystFacade.Droid
{
    /// <summary>
    /// Manages user token refreshing using TMM Intent - "com.trimble.tmm.RefreshUserToken"
    /// </summary>
    /// <seealso cref="Android.App.Activity" />
    public abstract class CatalystFacadeActivity : Activity
    {
        private const long UserTokenRefreshTimePeriod = 5 * 60 * 60 * 1000;
        public const int UserTokenRefreshRequest = 100;
		
        private static readonly int LocalSettingsRequest = GetUniqueRequestCode();
        protected static int GetUniqueRequestCode()
        {
            return Math.Abs(new object().GetHashCode()); // Needs to be positive for android 10
        }


        private Timer _userTokenRefreshTimer;
        public abstract String AppGuid { get; }

        protected CatalystFacadeActivity()
        {

            _userTokenRefreshTimer = new Timer(state =>
            {
                /* 
                 * Initializes the user token refresh timer,
                 * using 'com.trimble.tmm.RefreshUserToken' intent of TMM.
                 * 
                 * This intent also returns info and error in simple text format.
                 * OnActivityResult method receives the additional information.
                 *
                 */
                var intent = new Intent("com.trimble.tmm.RefreshUserToken");
                intent.PutExtra("applicationID", AppGuid);
                StartActivityForResult(intent, UserTokenRefreshRequest);

            });
        }

        protected override void OnResume()
        {
            _userTokenRefreshTimer.Change(UserTokenRefreshTimePeriod, UserTokenRefreshTimePeriod);
            base.OnResume();
        }

        protected override void OnStop()
        {
            _userTokenRefreshTimer.Change(Timeout.Infinite, Timeout.Infinite);
            base.OnStop();
        }

        protected void RequestLocalSettingsFromTMM(Action<Exception> onRequestCompleted)
        {
            Intent intent = new Intent("com.trimble.tmm.CORRECTIONSOURCESETTINGS");
            intent.PutExtra("applicationID", AppGuid);
            StartActivityForResult(intent, LocalSettingsRequest);
        }
    }
}