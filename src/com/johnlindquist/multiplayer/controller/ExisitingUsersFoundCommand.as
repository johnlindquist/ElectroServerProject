package com.johnlindquist.multiplayer.controller 
{
	import flight.domain.Command;

	import com.electrotank.electroserver4.user.User;
	import com.johnlindquist.multiplayer.game.heroes.OtherHero;
	import com.johnlindquist.multiplayer.game.model.GameModel;
	/**
	 * @author John Lindquist
	 */
	public class ExisitingUsersFoundCommand extends Command 
	{
		[Inject]
		public var users:Array;
		
		[Inject]
		public var gameModel:GameModel;
		
		override public function execute():void 
		{
			for each(var user:User in users)
			{
				trace("existing user: ", user.getUserId());
				var hero:OtherHero = new OtherHero(user);
				hero.color = Math.random() * 0xffffff;
				hero.x = 50;
				hero.y = 50;
				gameModel.heroes.add(hero);
			}
		}
	}
}
