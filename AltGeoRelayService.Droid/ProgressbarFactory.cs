using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Android.Graphics;
using Color = Android.Graphics.Color;
using ProgressBar = Android.Widget.ProgressBar;
using Window = Android.Views.Window;

namespace AltGeoRelayService.Droid
{
    internal class ProgressbarFactory
    {
        internal static AlertDialog CreateProgressDialog(Context context, String msg)
        {

            int llPadding = 30;
            LinearLayout ll = new LinearLayout(context);
            ll.Orientation = Orientation.Horizontal;
            ll.SetPadding(llPadding, llPadding, llPadding, llPadding);
            ll.SetGravity(GravityFlags.Center);
            LinearLayout.LayoutParams llParam = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WrapContent,
                ViewGroup.LayoutParams.WrapContent);
            llParam.Gravity = GravityFlags.Center;
            ll.LayoutParameters = llParam;

            ProgressBar progressBar = new ProgressBar(context);
            progressBar.Indeterminate =true;
            progressBar.SetPadding(0, 0, llPadding, 0);
            progressBar.LayoutParameters = llParam;

            llParam = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WrapContent,
                ViewGroup.LayoutParams.WrapContent);
            llParam.Gravity = GravityFlags.Center;
            TextView tvText = new TextView(context);
            tvText.Text =msg;
            tvText.SetTextColor(Color.ParseColor("#000000"));
            tvText.TextSize = 20;
            tvText.LayoutParameters = llParam;

            ll.AddView(progressBar);
            ll.AddView(tvText);

            AlertDialog.Builder builder = new AlertDialog.Builder(context);
            builder.SetCancelable(false);
            builder.SetView(ll);

            AlertDialog dialog = builder.Create();
            Window window = dialog.Window;
            if (window != null)
            {
                WindowManagerLayoutParams layoutParams = new WindowManagerLayoutParams();
                layoutParams.CopyFrom(dialog.Window.Attributes);
                layoutParams.Width = ViewGroup.LayoutParams.WrapContent;
                layoutParams.Height = ViewGroup.LayoutParams.WrapContent;
                dialog.Window.Attributes = layoutParams;
            }
            return dialog;
        }
    }
}