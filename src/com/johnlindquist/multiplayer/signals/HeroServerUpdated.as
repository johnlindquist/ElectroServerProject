package com.johnlindquist.multiplayer.signals 
{
	import com.electrotank.electroserver4.message.event.UserVariableUpdateEvent;

	import org.osflash.signals.Signal;
	/**
	 * @author John Lindquist
	 */
	public class HeroServerUpdated extends Signal 
	{
		public function HeroServerUpdated()
		{
			super(UserVariableUpdateEvent);
		}
	}
}
