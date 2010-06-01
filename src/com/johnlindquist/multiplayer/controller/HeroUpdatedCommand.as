package com.johnlindquist.multiplayer.controller 
{
	import flight.domain.Command;

	import com.electrotank.electroserver4.message.request.UpdateUserVariableRequest;
	import com.johnlindquist.multiplayer.game.heroes.MyHero;
	import com.johnlindquist.multiplayer.services.ElectroServerService;
	import com.johnlindquist.multiplayer.services.data.HeroUpdateData;
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
			var update:UpdateUserVariableRequest = new UpdateUserVariableRequest();
			update.setName("updateHero");
			
			var heroUpdate:HeroUpdateData = new HeroUpdateData(myHero.x, myHero.y);
			update.setValue(heroUpdate);
			electroServerService.send(update);
		}
	}
}
