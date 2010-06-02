package com.johnlindquist.multiplayer.controller
{
	import flight.domain.Command;

	import org.flixel.MyAwesomeGame;

	import flash.display.DisplayObjectContainer;
	/**
     * @author John Lindquist
     */
    public class SetupFlixel extends Command
    {

        [Inject]
        public var contextView:DisplayObjectContainer;


        override public function execute():void
        {
            contextView.addChild(new MyAwesomeGame());
        }
    }
}
