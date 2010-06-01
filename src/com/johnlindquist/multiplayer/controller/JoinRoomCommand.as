package com.johnlindquist.multiplayer.controller
{
	import flight.domain.AsyncCommand;

	import com.johnlindquist.multiplayer.game.model.Config;
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

        override public function execute():void
        {
            response = electroServerService.joinRoom(config.properties.room, config.properties.zone);
		}
    }
}
