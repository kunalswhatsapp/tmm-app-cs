package crc640eda0984e46970d1;


public class LicenseFeatureInfoParcelable
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		android.os.Parcelable
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_GetCreator:()Lcrc6405db95066ba03620/GenericParcelableCreator_1;:__export__\n" +
			"n_describeContents:()I:GetDescribeContentsHandler:Android.OS.IParcelableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"n_writeToParcel:(Landroid/os/Parcel;I)V:GetWriteToParcel_Landroid_os_Parcel_IHandler:Android.OS.IParcelableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"";
		mono.android.Runtime.register ("Trimble.Tmm.LicenseFeatureInfoParcelable, Trimble.LicensingV2.NET", LicenseFeatureInfoParcelable.class, __md_methods);
	}


	public LicenseFeatureInfoParcelable ()
	{
		super ();
		if (getClass () == LicenseFeatureInfoParcelable.class) {
			mono.android.TypeManager.Activate ("Trimble.Tmm.LicenseFeatureInfoParcelable, Trimble.LicensingV2.NET", "", this, new java.lang.Object[] {  });
		}
	}

	public LicenseFeatureInfoParcelable (android.os.Parcel p0)
	{
		super ();
		if (getClass () == LicenseFeatureInfoParcelable.class) {
			mono.android.TypeManager.Activate ("Trimble.Tmm.LicenseFeatureInfoParcelable, Trimble.LicensingV2.NET", "Android.OS.Parcel, Mono.Android", this, new java.lang.Object[] { p0 });
		}
	}


	public static crc6405db95066ba03620.GenericParcelableCreator_1 CREATOR = GetCreator ();

	public static crc6405db95066ba03620.GenericParcelableCreator_1 GetCreator ()
	{
		return n_GetCreator ();
	}

	private static native crc6405db95066ba03620.GenericParcelableCreator_1 n_GetCreator ();


	public int describeContents ()
	{
		return n_describeContents ();
	}

	private native int n_describeContents ();


	public void writeToParcel (android.os.Parcel p0, int p1)
	{
		n_writeToParcel (p0, p1);
	}

	private native void n_writeToParcel (android.os.Parcel p0, int p1);

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
