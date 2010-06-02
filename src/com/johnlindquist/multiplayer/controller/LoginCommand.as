package com.johnlindquist.multiplayer.controller
{
	import flight.domain.AsyncCommand;

	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.johnlindquist.multiplayer.services.ElectroServerService;
	/**
     * @author John Lindquist
     */
    public class LoginCommand extends AsyncCommand
    {

        [Inject]
        public var electroServerService:ElectroServerService;
        
        [Inject]
		public var gameModel:GameModel;

        override public function execute():void
        {
        	gameModel.status = gameModel.LOGGING_IN;
        		
            var userName:String = "user" + Math.round(1000 * Math.random());
            response = electroServerService.login(userName);
        }
    }
}
