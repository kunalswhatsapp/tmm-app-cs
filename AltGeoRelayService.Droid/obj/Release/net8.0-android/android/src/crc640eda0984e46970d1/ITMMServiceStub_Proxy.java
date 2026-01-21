package crc640eda0984e46970d1;


public class ITMMServiceStub_Proxy
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		android.os.IInterface
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_asBinder:()Landroid/os/IBinder;:GetAsBinderHandler:Android.OS.IInterfaceInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"";
		mono.android.Runtime.register ("Trimble.Tmm.ITMMServiceStub+Proxy, Trimble.LicensingV2.NET", ITMMServiceStub_Proxy.class, __md_methods);
	}


	public ITMMServiceStub_Proxy ()
	{
		super ();
		if (getClass () == ITMMServiceStub_Proxy.class) {
			mono.android.TypeManager.Activate ("Trimble.Tmm.ITMMServiceStub+Proxy, Trimble.LicensingV2.NET", "", this, new java.lang.Object[] {  });
		}
	}

	public ITMMServiceStub_Proxy (android.os.IBinder p0)
	{
		super ();
		if (getClass () == ITMMServiceStub_Proxy.class) {
			mono.android.TypeManager.Activate ("Trimble.Tmm.ITMMServiceStub+Proxy, Trimble.LicensingV2.NET", "Android.OS.IBinder, Mono.Android", this, new java.lang.Object[] { p0 });
		}
	}


	public android.os.IBinder asBinder ()
	{
		return n_asBinder ();
	}

	private native android.os.IBinder n_asBinder ();

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
