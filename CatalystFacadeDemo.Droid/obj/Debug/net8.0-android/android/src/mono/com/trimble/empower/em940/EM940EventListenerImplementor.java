package mono.com.trimble.empower.em940;


public class EM940EventListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.trimble.empower.em940.EM940EventListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onBytesAvailable:(I)V:GetOnBytesAvailable_IHandler:Com.Trimble.Empower.Em940.IEM940EventListenerInvoker, EM940Lib-Mono-Android\n" +
			"n_onLineStatusChanged:(I)V:GetOnLineStatusChanged_IHandler:Com.Trimble.Empower.Em940.IEM940EventListenerInvoker, EM940Lib-Mono-Android\n" +
			"n_onModemStatusChanged:(I)V:GetOnModemStatusChanged_IHandler:Com.Trimble.Empower.Em940.IEM940EventListenerInvoker, EM940Lib-Mono-Android\n" +
			"";
		mono.android.Runtime.register ("Com.Trimble.Empower.Em940.IEM940EventListenerImplementor, EM940Lib-Mono-Android", EM940EventListenerImplementor.class, __md_methods);
	}


	public EM940EventListenerImplementor ()
	{
		super ();
		if (getClass () == EM940EventListenerImplementor.class) {
			mono.android.TypeManager.Activate ("Com.Trimble.Empower.Em940.IEM940EventListenerImplementor, EM940Lib-Mono-Android", "", this, new java.lang.Object[] {  });
		}
	}


	public void onBytesAvailable (int p0)
	{
		n_onBytesAvailable (p0);
	}

	private native void n_onBytesAvailable (int p0);


	public void onLineStatusChanged (int p0)
	{
		n_onLineStatusChanged (p0);
	}

	private native void n_onLineStatusChanged (int p0);


	public void onModemStatusChanged (int p0)
	{
		n_onModemStatusChanged (p0);
	}

	private native void n_onModemStatusChanged (int p0);

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
