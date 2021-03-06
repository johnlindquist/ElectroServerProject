package com.johnlindquist.multiplayer
{
	import flight.domain.MacroCommand;

	import com.johnlindquist.multiplayer.controller.ConfigCommand;
	import com.johnlindquist.multiplayer.controller.ConnectCommand;
	import com.johnlindquist.multiplayer.controller.JoinRoomCommand;
	import com.johnlindquist.multiplayer.controller.LoginCommand;
	import com.johnlindquist.multiplayer.controller.SetupFlixel;
	import com.johnlindquist.multiplayer.controller.StartGameCommand;

	import org.robotlegs.core.IInjector;
	/**
     * @author John Lindquist
     */
    public class StartupCompleteMacroCommand extends MacroCommand
    {

        [Inject]
        public var injector:IInjector;

        [PostConstruct]
        public function init():void
        {
            var startFlixel:SetupFlixel = new SetupFlixel();
			var configCommand:ConfigCommand = new ConfigCommand();
            var connectCommand:ConnectCommand = new ConnectCommand();
            var loginCommand:LoginCommand = new LoginCommand();
            var joinRoomCommand:JoinRoomCommand = new JoinRoomCommand();
            var startGameCommand:StartGameCommand = new StartGameCommand();

            injector.injectInto(startFlixel);
            injector.injectInto(configCommand);
			injector.injectInto(connectCommand);
            injector.injectInto(loginCommand);
            injector.injectInto(joinRoomCommand);
            injector.injectInto(startGameCommand);

            commands.addItem(startFlixel);
            commands.addItem(configCommand);
			commands.addItem(connectCommand);
            commands.addItem(loginCommand);
            commands.addItem(joinRoomCommand);
            commands.addItem(startGameCommand);
        }
    }
}
