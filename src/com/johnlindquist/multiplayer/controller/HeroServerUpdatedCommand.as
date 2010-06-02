package com.johnlindquist.multiplayer.controller 
{
	import flight.domain.Command;

	import com.electrotank.electroserver4.esobject.EsObject;
	import com.electrotank.electroserver4.message.event.UserVariableUpdateEvent;
	import com.johnlindquist.multiplayer.game.heroes.Hero;
	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.johnlindquist.multiplayer.services.data.HeroServerUpdateData;
	/**
	 * @author John Lindquist
	 */
	public class HeroServerUpdatedCommand extends Command 
	{

		[Inject]
		public var userVariableUpdateEvent:UserVariableUpdateEvent;

		[Inject]
		public var gameModel:GameModel;

		override public function execute():void 
		{
			var hero:Hero;
			var killerId:String = userVariableUpdateEvent.getUserId();
			var userVarUserId:String;
			var userId:String;
			var killer:Hero;
			
			if(userVariableUpdateEvent.getVariable().getName() == GameModel.HERO_RESET)
			{
				for each(hero in gameModel.heroes.members)
				{
					userVarUserId = userVariableUpdateEvent.getVariable().getValue().getString(GameModel.HERO_RESET_USERNAME);
					userId = hero.user.getUserName();
					if(userVarUserId == userId)
					{
						hero.exists = true;
						hero.dead = false;
						return;
					}
				}
			}
			
			
			
			if(userVariableUpdateEvent.getVariable().getName() == GameModel.KILL_HERO)
			{
				for each(hero in gameModel.heroes.members)
				{
					if(killerId == hero.user.getUserId())
					{
						killer = hero;
					}
				}
				
				hero = gameModel.myHero;
				if(killerId == hero.user.getUserId())
				{
					killer = hero;
				}
				
				killer.score++;
				
				
				for each(hero in gameModel.heroes.members)
				{
					userVarUserId = userVariableUpdateEvent.getVariable().getValue().getString(GameModel.KILL_ID);
					userId = hero.user.getUserName();
					if(userVarUserId == userId)
					{
						hero.kill();
						return;
					}
				}
				
				hero = gameModel.myHero;
				userId = hero.user.getUserName();
				if(userVarUserId == userId)
				{
					hero.kill();
					return;
				}
			}

			if(userVariableUpdateEvent.getVariable().getName() == GameModel.HERO_UPDATED)
			{
				var heroUpdate:EsObject = userVariableUpdateEvent.getVariable().getValue() as EsObject;
				var heroServerUpdateData:HeroServerUpdateData = new HeroServerUpdateData(userVariableUpdateEvent.getUserId(), heroUpdate.getFloat("x"), heroUpdate.getFloat("y"));
				
				for each(hero in gameModel.heroes.members)
				{
					if(heroServerUpdateData.id != gameModel.myHero.user.getUserId())
					{
						if(heroServerUpdateData.id == hero.user.getUserId())
						{
							hero.x = heroServerUpdateData.x;
							hero.y = heroServerUpdateData.y;
							return;
						}
					}
				}
			}
		}
	}
}
