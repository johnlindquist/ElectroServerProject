package com.johnlindquist.multiplayer.game.heroes 
{
	import com.electrotank.electroserver4.user.User;

	import org.flixel.FlxSprite;
	/**
	 * @author John Lindquist
	 */
	public class Hero extends FlxSprite 
	{
		private var _user:User;

		[Bindable]
		public var score:uint = 0;
		public var targetX:Number;
		public var targetY:Number;

		public function get user():User
		{
			return _user;
		}
		
		public function Hero(user:User, X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null)
		{
			_user = user;
			super(X, Y, SimpleGraphic);
		}
	}
}
