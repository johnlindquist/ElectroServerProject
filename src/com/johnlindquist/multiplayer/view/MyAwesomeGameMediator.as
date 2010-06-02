package com.johnlindquist.multiplayer.view
{
    import org.flixel.FlxG;
    import org.flixel.MyAwesomeGame;
    import flight.binding.Bind;
    import com.johnlindquist.multiplayer.game.model.GameModel;
    import org.robotlegs.mvcs.Mediator;

    /**
     * @author John Lindquist
     */
    public class MyAwesomeGameMediator extends Mediator
    {
    	[Inject]
    	public var gameModel:GameModel;

		[Inject]
		public var myAwesomeGame:MyAwesomeGame;
		
		override public function onRegister():void 
		{
//			Bind.addBinding(FlxG, "state", gameModel, "state");
		}
	}
}
