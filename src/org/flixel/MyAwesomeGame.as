package org.flixel
{
	import com.johnlindquist.multiplayer.game.states.MenuState;

	import flash.ui.Mouse;
	/**
	 * @author John Lindquist
	 */
	public class MyAwesomeGame extends FlxGame
	{
		public function MyAwesomeGame()
		{
			super(640, 480, MenuState);
		}

		/* 
		 * to disable the pause game, I had to put this class in org.flixel
		 * package because it's internal
		 */
		
		override internal function pauseGame():void 
		{
			flash.ui.Mouse.show();
			_paused = false;
			stage.frameRate = _framerate;
		}
	}
}
