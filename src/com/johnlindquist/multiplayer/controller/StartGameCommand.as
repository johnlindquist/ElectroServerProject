package com.johnlindquist.multiplayer.controller
{
	import flight.domain.Command;

	import com.johnlindquist.multiplayer.game.model.GameModel;
	/**
	 * @author John Lindquist
     */
    public class StartGameCommand extends Command
    {

        [Inject]
        public var gameModel:GameModel;

        override public function execute():void
        {
			gameModel.status = gameModel.CLICK_TO_START;
		}
	}
}
