package crc64775202d62a505530;


public class c
	extends com.trimble.bluebottle.remoteapi.IBlueBottleCallback.Stub
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onBlueBottleCallBackReceived:([B)[B:GetOnBlueBottleCallBackReceived_arrayBHandler\n" +
			"";
		mono.android.Runtime.register ("a.c, Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android", c.class, __md_methods);
	}


	public c ()
	{
		super ();
		if (getClass () == c.class) {
			mono.android.TypeManager.Activate ("a.c, Trimble.Ssi.Driver.AndroidService.Driver.Catalyst.NET.Android", "", this, new java.lang.Object[] {  });
		}
	}


	public byte[] onBlueBottleCallBackReceived (byte[] p0)
	{
		return n_onBlueBottleCallBackReceived (p0);
	}

	private native byte[] n_onBlueBottleCallBackReceived (byte[] p0);

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
