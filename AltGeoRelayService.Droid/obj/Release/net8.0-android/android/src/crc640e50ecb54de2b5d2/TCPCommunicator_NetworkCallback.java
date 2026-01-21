package crc640e50ecb54de2b5d2;


public class TCPCommunicator_NetworkCallback
	extends android.net.ConnectivityManager.NetworkCallback
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onAvailable:(Landroid/net/Network;)V:GetOnAvailable_Landroid_net_Network_Handler\n" +
			"n_onLost:(Landroid/net/Network;)V:GetOnLost_Landroid_net_Network_Handler\n" +
			"";
		mono.android.Runtime.register ("CatalystFacade.Droid.TCPCommunicator+NetworkCallback, CatalystFacade.NET.Droid", TCPCommunicator_NetworkCallback.class, __md_methods);
	}


	public TCPCommunicator_NetworkCallback ()
	{
		super ();
		if (getClass () == TCPCommunicator_NetworkCallback.class) {
			mono.android.TypeManager.Activate ("CatalystFacade.Droid.TCPCommunicator+NetworkCallback, CatalystFacade.NET.Droid", "", this, new java.lang.Object[] {  });
		}
	}


	public void onAvailable (android.net.Network p0)
	{
		n_onAvailable (p0);
	}

	private native void n_onAvailable (android.net.Network p0);


	public void onLost (android.net.Network p0)
	{
		n_onLost (p0);
	}

	private native void n_onLost (android.net.Network p0);

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
