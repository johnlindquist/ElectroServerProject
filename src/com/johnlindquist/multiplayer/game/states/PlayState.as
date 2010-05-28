package com.johnlindquist.multiplayer.game.states
{
	import com.johnlindquist.multiplayer.game.heroes.MyHero;
	import com.johnlindquist.multiplayer.game.heroes.OtherHero;
	import com.johnlindquist.multiplayer.game.maps.SimpleMap;
	import com.johnlindquist.multiplayer.signals.HeroUpdated;

	import org.flixel.FlxGroup;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;
	/**
	 * @author John Lindquist
	 */
	public class PlayState extends FlxState 
	{
		
		private var simpleMap:SimpleMap;

		public var heroUpdated:HeroUpdated = new HeroUpdated();

		private var _myHero:MyHero;
		public function get myHero():MyHero
		{
			return _myHero;
		}

		public function set myHero(value:MyHero):void
		{
			_myHero = value;
			myHero.x = 50;
			myHero.y = 50;
			heroes.add(myHero);			
		}

		override public function create():void
		{
			var flxText:FlxText = new FlxText(0, 0, 100, "My Awesome Game");
			add(flxText);
			simpleMap = new SimpleMap();
			add(simpleMap);
		}

		override public function update():void 
		{
			FlxU.collide(myHero, heroes);
			FlxU.collide(myHero, simpleMap);
			FlxU.collide(heroes, heroes);
			FlxU.collide(simpleMap, heroes);
			super.update();
			
			if(myHero != null)
			{
				 heroUpdated.dispatch(myHero);
			}
		}
		
		private var _heroes:FlxGroup;
		public function get heroes():FlxGroup
		{
			return _heroes;
		}
		
		public function set heroes(heroes:FlxGroup):void
		{
			_heroes = heroes;
			add(_heroes);
		}
	}
}
