package com.johnlindquist.multiplayer.controller
{
    import flight.domain.AsyncCommand;

    import com.johnlindquist.multiplayer.services.ElectroServerService;

    /**
     * @author John Lindquist
     */
    public class LoginCommand extends AsyncCommand
    {

        [Inject]
        public var electroServerService:ElectroServerService;

        override public function execute():void
        {
            var userName:String = "user" + Math.round(1000 * Math.random());
            response = electroServerService.login(userName);
        }
    }
}
