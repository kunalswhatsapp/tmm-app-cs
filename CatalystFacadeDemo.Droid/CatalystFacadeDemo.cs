using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Application = Android.App.Application;

namespace CatalystFacadeDemo.Droid
{
    [Application]
    class CatalystFacadeDemo : Application
    {
        public CatalystFacadeDemo(IntPtr handle, JniHandleOwnership ownerShip) : base(handle, ownerShip)
        {

        }
        public override void OnCreate()
        {
            MainModel.Instance.Init(ApplicationContext);
        }
    }
}