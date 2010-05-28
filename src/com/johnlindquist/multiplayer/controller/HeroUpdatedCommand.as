package com.johnlindquist.multiplayer.controller 
{
	import com.johnlindquist.multiplayer.game.heroes.MyHero;
	import com.johnlindquist.multiplayer.services.ElectroServerService;
	import flight.domain.Command;
	/**
	 * @author John Lindquist
	 */
	public class HeroUpdatedCommand extends Command 
	{
		[Inject]
		public var myHero:MyHero;
		
		[Inject]
		public var electroServerService:ElectroServerService;

		
		override public function execute():void 
		{
			electroServerService.updateHero(myHero);
		}
	}
}
