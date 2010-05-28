package com.johnlindquist.multiplayer.signals 
{
	import com.electrotank.electroserver4.user.User;
	import org.osflash.signals.Signal;
	/**
	 * @author John Lindquist
	 */
	public class MyUserAdded extends Signal 
	{
		public function MyUserAdded()
		{
			super(User);
		}
	}
}
