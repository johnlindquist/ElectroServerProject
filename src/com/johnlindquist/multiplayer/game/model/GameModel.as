package com.johnlindquist.multiplayer.game.model
{
	import flash.events.EventDispatcher;
	import com.johnlindquist.multiplayer.game.states.MenuState;
	import com.johnlindquist.multiplayer.game.heroes.MyHero;

	import org.flixel.FlxG;
	import org.flixel.FlxGroup;

	/**
     * @author John Lindquist
     */
    [Bindable]
    public class GameModel
	{
		public static const KILL_HERO:String = "KILL_HERO";
		public static const KILL_ID:String = "KILL_ID";
		public static const HERO_RESET:String = "HERO_RESET";
		public static const HERO_RESET_USERNAME:String = "HERO_RESET_ID";
		public static const HERO_UPDATED:String = "HERO_UPDATED";

		
		public const CLICK_TO_START:String = "Press A to start";
		public const LOADING_CONFIG:String = "Loading config";
		public const LOGGING_IN:String = "Logging in";
		public const CONNECTING:String = "Connecting to server";
		public const JOINING_ROOM:String = "Joining room";

		public var status:String = "Connecting";
    	
		public var heroes:FlxGroup = new FlxGroup();
		public var myHero:MyHero;
		
		private var _state:Class = MenuState;

		public function get state():Class
		{
			return _state;
		}
		
		public function set state(state:Class):void
		{
			FlxG.state = new state();
			_state = state;
		}
	}
}
