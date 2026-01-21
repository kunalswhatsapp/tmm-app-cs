package crc640eda0984e46970d1;


public abstract class ITMMServiceStub
	extends android.os.Binder
	implements
		mono.android.IGCUserPeer,
		android.os.IInterface
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onTransact:(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z:GetOnTransact_ILandroid_os_Parcel_Landroid_os_Parcel_IHandler\n" +
			"n_asBinder:()Landroid/os/IBinder;:GetAsBinderHandler:Android.OS.IInterfaceInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"";
		mono.android.Runtime.register ("Trimble.Tmm.ITMMServiceStub, Trimble.LicensingV2.NET", ITMMServiceStub.class, __md_methods);
	}


	public ITMMServiceStub ()
	{
		super ();
		if (getClass () == ITMMServiceStub.class) {
			mono.android.TypeManager.Activate ("Trimble.Tmm.ITMMServiceStub, Trimble.LicensingV2.NET", "", this, new java.lang.Object[] {  });
		}
	}


	public boolean onTransact (int p0, android.os.Parcel p1, android.os.Parcel p2, int p3)
	{
		return n_onTransact (p0, p1, p2, p3);
	}

	private native boolean n_onTransact (int p0, android.os.Parcel p1, android.os.Parcel p2, int p3);


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
