package com.johnlindquist.multiplayer.game.states
{
	import com.johnlindquist.multiplayer.signals.HeroReset;

	import org.flixel.FlxG;
	import com.johnlindquist.multiplayer.game.heroes.MyHero;
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
		public var score:FlxText = new FlxText(300, 0, 100, "0");
		public var deadNote:FlxText = new FlxText(200, 200, 100, "Press A to respawn");
		public var heroReset:HeroReset = new HeroReset();
		private var elapsed:Number = 0;

		
		
		public function get myHero():MyHero
		{
			return _myHero;
		}

		public function set myHero(value:MyHero):void
		{
			_myHero = value;
			myHero.x = 50;
			myHero.y = 50;
			add(myHero);			
		}

		override public function create():void
		{
			simpleMap = new SimpleMap();
			add(simpleMap);
			
			var flxText:FlxText = new FlxText(0, 0, 100, "My Awesome Game");
			add(flxText);
			add(score);
			
			deadNote.visible = false;
			add(deadNote);
		}

		override public function update():void 
		{
			FlxU.collide(myHero, heroes);
			FlxU.collide(myHero, simpleMap);
			FlxU.collide(heroes, heroes);
			FlxU.collide(simpleMap, heroes);
			
			super.update();
			
			elapsed += FlxG.elapsed;
			
			if(myHero != null && myHero.exists && !myHero.dead && elapsed > .04)
			{
				heroUpdated.dispatch(myHero);
				elapsed = 0;
			}
			
			if(myHero.dead)
			{
				deadNote.visible = true;
				if(FlxG.keys.A)
				{
					heroReset.dispatch(myHero);
					deadNote.visible = false;
					myHero.reset(50, 50);
				}
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
		}

		public function addHeroes(heroes:FlxGroup):void 
		{
			add(heroes);
		}
	}
}
