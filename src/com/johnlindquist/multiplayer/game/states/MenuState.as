package com.johnlindquist.multiplayer.game.states 
{
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.osflash.signals.Signal;
	/**
	 * @author John Lindquist
	 */
	public class MenuState extends FlxState 
	{
		public var startClicked:Signal = new Signal();
		public var startText:FlxText = new FlxText(0, 0, 200, "Starting up");

		override public function create():void 
		{
			add(startText);
		}

		
		override public function update():void 
		{
			if(FlxG.keys.A)
			{
				startClicked.dispatch();
			}
		}
	}
}
