package crc640e50ecb54de2b5d2;


public abstract class CatalystFacadeActivity
	extends android.app.Activity
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onResume:()V:GetOnResumeHandler\n" +
			"n_onStop:()V:GetOnStopHandler\n" +
			"";
		mono.android.Runtime.register ("CatalystFacade.Droid.CatalystFacadeActivity, CatalystFacade.NET.Droid", CatalystFacadeActivity.class, __md_methods);
	}


	public CatalystFacadeActivity ()
	{
		super ();
		if (getClass () == CatalystFacadeActivity.class) {
			mono.android.TypeManager.Activate ("CatalystFacade.Droid.CatalystFacadeActivity, CatalystFacade.NET.Droid", "", this, new java.lang.Object[] {  });
		}
	}


	public void onResume ()
	{
		n_onResume ();
	}

	private native void n_onResume ();


	public void onStop ()
	{
		n_onStop ();
	}

	private native void n_onStop ();

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
