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
			for each(var hero:Hero in gameModel.heroes.members)
			{
				if(heroServerUpdateData.id != gameModel.myHero.user.getUserId())
				{
					if(heroServerUpdateData.id == hero.user.getUserId())
					{
						hero.x = heroServerUpdateData.x;
						hero.y = heroServerUpdateData.y;
					}
				}
			}
		}
	}
}
