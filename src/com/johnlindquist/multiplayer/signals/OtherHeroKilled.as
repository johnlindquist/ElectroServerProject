package com.johnlindquist.multiplayer.signals 
{
	import com.johnlindquist.multiplayer.game.heroes.OtherHero;
	import org.osflash.signals.Signal;
	/**
	 * @author John Lindquist
	 */
	public class OtherHeroKilled extends Signal 
	{
		public function OtherHeroKilled()
		{
			super(OtherHero);
		}
	}
}
