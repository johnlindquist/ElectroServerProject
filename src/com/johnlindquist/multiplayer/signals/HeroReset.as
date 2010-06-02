package com.johnlindquist.multiplayer.signals 
{
	import com.johnlindquist.multiplayer.game.heroes.MyHero;

	import org.osflash.signals.Signal;
	/**
	 * @author John Lindquist
	 */
	public class HeroReset extends Signal 
	{
		public function HeroReset()
		{
			super(MyHero);
		}
	}
}
