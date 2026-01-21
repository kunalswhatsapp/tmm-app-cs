package mono.com.trimble.empower;


public class ScioConfigurationListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.trimble.empower.ScioConfigurationListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_configurationDeregistered:(Lcom/trimble/empower/ScioConfiguration;)V:GetConfigurationDeregistered_Lcom_trimble_empower_ScioConfiguration_Handler:Com.Trimble.Empower.IScioConfigurationListenerInvoker, Trimble.EMPOWER.JavaBinding.Droid\n" +
			"n_configurationRegistered:(Lcom/trimble/empower/ScioConfiguration;)V:GetConfigurationRegistered_Lcom_trimble_empower_ScioConfiguration_Handler:Com.Trimble.Empower.IScioConfigurationListenerInvoker, Trimble.EMPOWER.JavaBinding.Droid\n" +
			"";
		mono.android.Runtime.register ("Com.Trimble.Empower.IScioConfigurationListenerImplementor, Trimble.EMPOWER.JavaBinding.Droid", ScioConfigurationListenerImplementor.class, __md_methods);
	}


	public ScioConfigurationListenerImplementor ()
	{
		super ();
		if (getClass () == ScioConfigurationListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Com.Trimble.Empower.IScioConfigurationListenerImplementor, Trimble.EMPOWER.JavaBinding.Droid", "", this, new java.lang.Object[] {  });
		}
	}


	public void configurationDeregistered (com.trimble.empower.ScioConfiguration p0)
	{
		n_configurationDeregistered (p0);
	}

	private native void n_configurationDeregistered (com.trimble.empower.ScioConfiguration p0);


	public void configurationRegistered (com.trimble.empower.ScioConfiguration p0)
	{
		n_configurationRegistered (p0);
	}

	private native void n_configurationRegistered (com.trimble.empower.ScioConfiguration p0);

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
