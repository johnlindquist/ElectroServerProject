package com.johnlindquist.multiplayer.controller 
{
	import flight.domain.Command;

	import com.electrotank.electroserver4.user.User;
	import com.johnlindquist.multiplayer.game.heroes.Hero;
	import com.johnlindquist.multiplayer.game.model.GameModel;
	/**
	 * @author John Lindquist
	 */
	public class UserLeftCommand extends Command 
	{
		[Inject]
		public var user:User;
		
		[Inject]
		public var gameModel:GameModel;

		override public function execute():void 
		{
			var hero:Hero;
			for each(hero in gameModel.heroes.members)
			{
				if(hero.user == user)
				{
					hero.kill();
					gameModel.heroes.remove(hero, true);
				}
			}	
		}
	}
}
