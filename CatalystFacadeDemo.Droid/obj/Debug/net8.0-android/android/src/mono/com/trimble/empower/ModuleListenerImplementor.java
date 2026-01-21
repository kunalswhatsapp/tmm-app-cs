package mono.com.trimble.empower;


public class ModuleListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.trimble.empower.ModuleListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_propertiesChanged:(ILjava/util/HashMap;)V:GetPropertiesChanged_ILjava_util_HashMap_Handler:Com.Trimble.Empower.IModuleListenerInvoker, Trimble.EMPOWER.JavaBinding.Droid\n" +
			"n_statusChanged:(ILcom/trimble/empower/ModuleStatus;)V:GetStatusChanged_ILcom_trimble_empower_ModuleStatus_Handler:Com.Trimble.Empower.IModuleListenerInvoker, Trimble.EMPOWER.JavaBinding.Droid\n" +
			"";
		mono.android.Runtime.register ("Com.Trimble.Empower.IModuleListenerImplementor, Trimble.EMPOWER.JavaBinding.Droid", ModuleListenerImplementor.class, __md_methods);
	}


	public ModuleListenerImplementor ()
	{
		super ();
		if (getClass () == ModuleListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Com.Trimble.Empower.IModuleListenerImplementor, Trimble.EMPOWER.JavaBinding.Droid", "", this, new java.lang.Object[] {  });
		}
	}


	public void propertiesChanged (int p0, java.util.HashMap p1)
	{
		n_propertiesChanged (p0, p1);
	}

	private native void n_propertiesChanged (int p0, java.util.HashMap p1);


	public void statusChanged (int p0, com.trimble.empower.ModuleStatus p1)
	{
		n_statusChanged (p0, p1);
	}

	private native void n_statusChanged (int p0, com.trimble.empower.ModuleStatus p1);

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
