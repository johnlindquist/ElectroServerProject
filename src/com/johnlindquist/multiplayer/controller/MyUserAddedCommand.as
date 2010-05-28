package com.johnlindquist.multiplayer.controller 
{
	import com.johnlindquist.multiplayer.game.heroes.MyHero;
	import com.johnlindquist.multiplayer.game.model.GameModel;
	import flight.domain.Command;

	import com.electrotank.electroserver4.user.User;
	/**
	 * @author John Lindquist
	 */
	public class MyUserAddedCommand extends Command 
	{
		[Inject]
		public var myUser:User;

		[Inject]
		public var gameModel:GameModel;
			
		override public function execute():void 
		{
			var myHero:MyHero = new MyHero(myUser);
			myHero.x = 50;
			myHero.y = 50;
			gameModel.myHero = myHero;
		}
	}
}
