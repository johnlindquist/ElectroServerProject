package com.johnlindquist.multiplayer.controller
{
	import flight.domain.AsyncCommand;

	import com.johnlindquist.multiplayer.game.model.Config;
	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.johnlindquist.multiplayer.services.ElectroServerService;
	/**
     * @author John Lindquist
     */
    public class ConnectCommand extends AsyncCommand
    {
		[Inject]
		public var config:Config;
		
        [Inject]
        public var electroServerService:ElectroServerService;
        
        [Inject]
		public var gameModel:GameModel;

        override public function execute():void
        {
        	gameModel.status = gameModel.CONNECTING;
			response = electroServerService.connect(config.properties.ip, config.properties.port);
			response.addFaultHandler(onResponseFault);
		}

		private function onResponseFault(error:Error):void 
		{
			throw error;	
		}
	}
}
