package com.johnlindquist.multiplayer.controller 
{
	import com.johnlindquist.multiplayer.game.model.GameModel;
	import flight.domain.Command;

	import com.electrotank.electroserver4.esobject.EsObject;
	import com.electrotank.electroserver4.message.request.UpdateUserVariableRequest;
	import com.johnlindquist.multiplayer.game.heroes.OtherHero;
	import com.johnlindquist.multiplayer.services.ElectroServerService;
	/**
	 * @author John Lindquist
	 */
	public class OtherHeroKilledCommand extends Command 
	{
		[Inject]
		public var otherHero:OtherHero;
		
		[Inject]
		public var electroServerService:ElectroServerService;
	
		override public function execute():void 
		{
			var update:UpdateUserVariableRequest = new UpdateUserVariableRequest();
			update.setName(GameModel.KILL_HERO);
			
			var esObject:EsObject = new EsObject();
			esObject.setString(GameModel.KILL_ID, otherHero.user.getUserName());
			update.setValue(esObject);
			electroServerService.send(update);
		}
	}
}
