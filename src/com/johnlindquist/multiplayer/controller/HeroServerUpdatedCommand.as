package com.johnlindquist.multiplayer.controller 
{
	import flight.domain.Command;

	import com.johnlindquist.multiplayer.game.heroes.Hero;
	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.johnlindquist.multiplayer.services.data.HeroServerUpdateData;
	/**
	 * @author John Lindquist
	 */
	public class HeroServerUpdatedCommand extends Command 
	{

		[Inject]
		public var heroServerUpdateData:HeroServerUpdateData;

		[Inject]
		public var gameModel:GameModel;

		override public function execute():void 
		{
			trace("executing update");
			for each(var hero:Hero in gameModel.heroes.members)
			{
				trace(hero, gameModel.heroes);
				if(heroServerUpdateData.id == hero.user.getUserId())
				{
					trace('heroServerUpdateData.id: ' + (heroServerUpdateData.id));
					hero.x = heroServerUpdateData.x;
					hero.y = heroServerUpdateData.y;
				}
			}
		}
	}
}
