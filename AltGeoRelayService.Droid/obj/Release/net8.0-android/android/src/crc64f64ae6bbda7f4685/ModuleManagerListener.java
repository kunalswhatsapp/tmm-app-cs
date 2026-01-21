package crc64f64ae6bbda7f4685;


public class ModuleManagerListener
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.trimble.empower.ModuleManagerStatusCallback
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onModuleManagerConnected:(Lcom/trimble/empower/ModuleManager;)V:GetOnModuleManagerConnected_Lcom_trimble_empower_ModuleManager_Handler:Com.Trimble.Empower.IModuleManagerStatusCallbackInvoker, Trimble.EMPOWER.JavaBinding.Droid\n" +
			"n_onModuleManagerDisconnected:()V:GetOnModuleManagerDisconnectedHandler:Com.Trimble.Empower.IModuleManagerStatusCallbackInvoker, Trimble.EMPOWER.JavaBinding.Droid\n" +
			"";
		mono.android.Runtime.register ("Trimble.Empower.Internal.ModuleManagerListener, Trimble.EMPOWER.Manager.Droid", ModuleManagerListener.class, __md_methods);
	}


	public ModuleManagerListener ()
	{
		super ();
		if (getClass () == ModuleManagerListener.class) {
			mono.android.TypeManager.Activate ("Trimble.Empower.Internal.ModuleManagerListener, Trimble.EMPOWER.Manager.Droid", "", this, new java.lang.Object[] {  });
		}
	}


	public void onModuleManagerConnected (com.trimble.empower.ModuleManager p0)
	{
		n_onModuleManagerConnected (p0);
	}

	private native void n_onModuleManagerConnected (com.trimble.empower.ModuleManager p0);


	public void onModuleManagerDisconnected ()
	{
		n_onModuleManagerDisconnected ();
	}

	private native void n_onModuleManagerDisconnected ();

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
