package com.johnlindquist.multiplayer.controller
{
    import com.johnlindquist.multiplayer.game.model.Config;
    import flight.domain.AsyncCommand;

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

        override public function execute():void
        {
            response = electroServerService.connect(config.properties.ip, config.properties.port);
		}
    }
}
