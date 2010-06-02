package com.johnlindquist.multiplayer.controller
{
	import flight.domain.AsyncCommand;

	import com.johnlindquist.multiplayer.game.model.Config;
	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.johnlindquist.multiplayer.services.ElectroServerService;
	/**
	 * @author John Lindquist
     */
    public class JoinRoomCommand extends AsyncCommand
    {
		[Inject]
		public var config:Config;
        
        [Inject]
        public var electroServerService:ElectroServerService;

		[Inject]
		public var gameModel:GameModel;

        override public function execute():void
        {
        	gameModel.status = gameModel.JOINING_ROOM;
			response = electroServerService.joinRoom(config.properties.room, config.properties.zone);
		}
    }
}
