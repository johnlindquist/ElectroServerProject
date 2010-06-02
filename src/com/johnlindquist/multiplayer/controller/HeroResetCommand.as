package com.johnlindquist.multiplayer.controller 
{
	import flight.domain.Command;

	import com.electrotank.electroserver4.esobject.EsObject;
	import com.electrotank.electroserver4.message.request.UpdateUserVariableRequest;
	import com.johnlindquist.multiplayer.game.heroes.MyHero;
	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.johnlindquist.multiplayer.services.ElectroServerService;
	/**
	 * @author John Lindquist
	 */
	public class HeroResetCommand extends Command 
	{
		[Inject]
		public var hero:MyHero;
		
		[Inject]
		public var electroServerService:ElectroServerService;

		
		override public function execute():void 
		{
			var update:UpdateUserVariableRequest = new UpdateUserVariableRequest();
			update.setName(GameModel.HERO_RESET);
			
			var esObject:EsObject = new EsObject();
			esObject.setString(GameModel.HERO_RESET_USERNAME, hero.user.getUserName());
			update.setValue(esObject);
			electroServerService.send(update);
		}
	}
}
