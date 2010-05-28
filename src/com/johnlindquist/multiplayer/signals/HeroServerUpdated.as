package com.johnlindquist.multiplayer.signals 
{
	import com.johnlindquist.multiplayer.services.data.HeroServerUpdateData;

	import org.osflash.signals.Signal;
	/**
	 * @author John Lindquist
	 */
	public class HeroServerUpdated extends Signal 
	{
		public function HeroServerUpdated()
		{
			super(HeroServerUpdateData);
		}
	}
}
