package com.johnlindquist.multiplayer.game.heroes 
{
	import com.electrotank.electroserver4.user.User;
	/**
	 * @author John Lindquist
	 */
	public class OtherHero extends Hero 
	{
		public function OtherHero(user:User)
		{
			super(user, 50, 50);
		}

		override public function update():void 
		{
			super.update();
		}
	}
}
