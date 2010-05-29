package com.johnlindquist.multiplayer.controller 
{
	import com.johnlindquist.multiplayer.game.heroes.OtherHero;
	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.electrotank.electroserver4.user.User;
	import flight.domain.Command;
	/**
	 * @author John Lindquist
	 */
	public class UserAddedCommand extends Command 
	{
		[Inject]
		public var user:User;
		
		[Inject]
		public var gameModel:GameModel;
		
		override public function execute():void 
		{
			var hero:OtherHero = new OtherHero(user);
			hero.color = Math.random() * 0xffffff;
			hero.x = 50;
			hero.y = 50;
			gameModel.heroes.add(hero);
		}
	}
}
