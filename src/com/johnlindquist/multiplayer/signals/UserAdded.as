package com.johnlindquist.multiplayer.signals 
{
	import com.electrotank.electroserver4.user.User;
	import org.osflash.signals.Signal;
	/**
	 * @author John Lindquist
	 */
	public class UserAdded extends Signal 
	{
		public function UserAdded()
		{
			super(User);
		}
	}
}
