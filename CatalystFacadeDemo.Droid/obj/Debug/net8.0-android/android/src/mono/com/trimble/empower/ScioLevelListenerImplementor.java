package mono.com.trimble.empower;


public class ScioLevelListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.trimble.empower.ScioLevelListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_levelChanged:(IZ)V:GetLevelChanged_IZHandler:Com.Trimble.Empower.IScioLevelListenerInvoker, Trimble.EMPOWER.JavaBinding.Droid\n" +
			"";
		mono.android.Runtime.register ("Com.Trimble.Empower.IScioLevelListenerImplementor, Trimble.EMPOWER.JavaBinding.Droid", ScioLevelListenerImplementor.class, __md_methods);
	}


	public ScioLevelListenerImplementor ()
	{
		super ();
		if (getClass () == ScioLevelListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Com.Trimble.Empower.IScioLevelListenerImplementor, Trimble.EMPOWER.JavaBinding.Droid", "", this, new java.lang.Object[] {  });
		}
	}


	public void levelChanged (int p0, boolean p1)
	{
		n_levelChanged (p0, p1);
	}

	private native void n_levelChanged (int p0, boolean p1);

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
