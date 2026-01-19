using Android.Content;
using System.Collections.Generic;
using System.IO;

namespace CatalystFacadeDemo.Droid
{
    internal class FacadeLogger
    {
        private static FacadeLogger _instance;
        private Context _androidContext;

        private object _threadAccess = System.Guid.NewGuid();

        internal string Filename => Path.Combine(_androidContext.GetExternalFilesDir(null).AbsolutePath, "facadelog.txt");

        internal static FacadeLogger Instance
        {
            get
            {
                if(_instance == null)
                {
                    _instance = new FacadeLogger();
                }

                return _instance;
            }
        }

        internal void Initialize(Context context)
        {
            _androidContext = context;

            if (System.IO.File.Exists(Filename))
            {
                System.IO.File.Delete(Filename);
            }
        }

        internal void LogMessage(string text)
        {
            if (_androidContext == null)
            {
                return;
            }

            lock (_threadAccess)
            {
                System.IO.File.AppendAllLines(Filename, new List<string>() { "--- " + text + " ---" });
            }
        }
    }
}
