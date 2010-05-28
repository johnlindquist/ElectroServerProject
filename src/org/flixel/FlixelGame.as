package org.flixel
{
	import com.johnlindquist.multiplayer.game.states.PlayState;
	/**
	 * @author John Lindquist
	 */
	public class FlixelGame extends FlxGame
	{
		public function FlixelGame()
		{
			super(640, 480, PlayState);
		}

		/* 
		 * to disable the pause game, I had to put this class in org.flixel
		 * package because it's internal
		 */
		
		override internal function pauseGame():void 
		{
			
		}
	}
}
