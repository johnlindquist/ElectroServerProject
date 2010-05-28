package com.johnlindquist.multiplayer.signals 
{
	import com.johnlindquist.multiplayer.game.heroes.MyHero;
	import org.osflash.signals.Signal;
	/**
	 * @author John Lindquist
	 */
	public class HeroUpdated extends Signal 
	{
		public function HeroUpdated()
		{
			super(MyHero);
		}
	}
}
