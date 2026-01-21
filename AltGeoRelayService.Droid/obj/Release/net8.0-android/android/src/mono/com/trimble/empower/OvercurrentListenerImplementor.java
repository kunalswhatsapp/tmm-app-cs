package mono.com.trimble.empower;


public class OvercurrentListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.trimble.empower.OvercurrentListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_globalOcChanged:(Z)V:GetGlobalOcChanged_ZHandler:Com.Trimble.Empower.IOvercurrentListenerInvoker, Trimble.EMPOWER.JavaBinding.Droid\n" +
			"";
		mono.android.Runtime.register ("Com.Trimble.Empower.IOvercurrentListenerImplementor, Trimble.EMPOWER.JavaBinding.Droid", OvercurrentListenerImplementor.class, __md_methods);
	}


	public OvercurrentListenerImplementor ()
	{
		super ();
		if (getClass () == OvercurrentListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Com.Trimble.Empower.IOvercurrentListenerImplementor, Trimble.EMPOWER.JavaBinding.Droid", "", this, new java.lang.Object[] {  });
		}
	}


	public void globalOcChanged (boolean p0)
	{
		n_globalOcChanged (p0);
	}

	private native void n_globalOcChanged (boolean p0);

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
