package com.johnlindquist.multiplayer.controller
{
    import com.johnlindquist.multiplayer.services.ElectroServerService;
    import flight.domain.AsyncCommand;

    /**
     * @author John Lindquist
     */
    public class JoinRoomCommand extends AsyncCommand
    {

        [Inject]
        public var electroServerService:ElectroServerService;

        override public function execute():void
        {
            response = electroServerService.joinRoom();
        }
    }
}
