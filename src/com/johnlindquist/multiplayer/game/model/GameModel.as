package com.johnlindquist.multiplayer.game.model
{
	import com.johnlindquist.multiplayer.game.heroes.MyHero;

	import org.flixel.FlxGroup;

	/**
     * @author John Lindquist
     */
    [Bindable]
    public class GameModel
    {
		public var heroes:FlxGroup = new FlxGroup();
		public var myHero:MyHero;
	}
}
