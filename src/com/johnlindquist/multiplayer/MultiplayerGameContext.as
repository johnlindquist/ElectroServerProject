package com.johnlindquist.multiplayer
{
	import com.johnlindquist.multiplayer.controller.HeroResetCommand;
	import com.johnlindquist.multiplayer.controller.ExisitingUsersFoundCommand;
	import com.johnlindquist.multiplayer.controller.HeroServerUpdatedCommand;
	import com.johnlindquist.multiplayer.controller.HeroUpdatedCommand;
	import com.johnlindquist.multiplayer.controller.MyUserAddedCommand;
	import com.johnlindquist.multiplayer.controller.OtherHeroKilledCommand;
	import com.johnlindquist.multiplayer.controller.StateChangedCommand;
	import com.johnlindquist.multiplayer.controller.UserAddedCommand;
	import com.johnlindquist.multiplayer.controller.UserLeftCommand;
	import com.johnlindquist.multiplayer.game.model.Config;
	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.johnlindquist.multiplayer.game.states.MenuState;
	import com.johnlindquist.multiplayer.game.states.PlayState;
	import com.johnlindquist.multiplayer.game.states.PlayStateMediator;
	import com.johnlindquist.multiplayer.services.ElectroServerService;
	import com.johnlindquist.multiplayer.signals.ExisitingUsersFound;
	import com.johnlindquist.multiplayer.signals.HeroReset;
	import com.johnlindquist.multiplayer.signals.HeroServerUpdated;
	import com.johnlindquist.multiplayer.signals.HeroUpdated;
	import com.johnlindquist.multiplayer.signals.MyUserAdded;
	import com.johnlindquist.multiplayer.signals.OtherHeroKilled;
	import com.johnlindquist.multiplayer.signals.StateChanged;
	import com.johnlindquist.multiplayer.signals.UserAdded;
	import com.johnlindquist.multiplayer.signals.UserLeft;
	import com.johnlindquist.multiplayer.view.MenuStateMediator;
	import com.johnlindquist.multiplayer.view.MyAwesomeGameMediator;

	import org.flixel.MyAwesomeGame;
	import org.osflash.signals.Signal;
	import org.robotlegs.mvcs.SignalContext;

	import flash.display.DisplayObjectContainer;
	/**
	 * @author John Lindquist
     */
    public class MultiplayerGameContext extends SignalContext
    {
        public function MultiplayerGameContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
        {
            super(contextView, autoStartup);
        }

        override public function startup():void
        {
        	injector.mapValue(String, "config.xml", "config");
        	
            injector.mapSingleton(Config);
            injector.mapSingleton(GameModel);
            injector.mapSingleton(ElectroServerService);

            mediatorMap.mapView(MyAwesomeGame, MyAwesomeGameMediator);
            mediatorMap.mapView(MenuState, MenuStateMediator);
            mediatorMap.mapView(PlayState, PlayStateMediator);
            
            signalCommandMap.mapSignalClass(StateChanged, StateChangedCommand);
            signalCommandMap.mapSignalClass(ExisitingUsersFound, ExisitingUsersFoundCommand);
            signalCommandMap.mapSignalClass(UserAdded, UserAddedCommand);
            signalCommandMap.mapSignalClass(UserLeft, UserLeftCommand);
            signalCommandMap.mapSignalClass(MyUserAdded, MyUserAddedCommand);
            signalCommandMap.mapSignalClass(HeroUpdated, HeroUpdatedCommand);
            signalCommandMap.mapSignalClass(HeroReset, HeroResetCommand);
            signalCommandMap.mapSignalClass(OtherHeroKilled, OtherHeroKilledCommand);
            signalCommandMap.mapSignalClass(HeroServerUpdated, HeroServerUpdatedCommand);

            var startupSignal:Signal = new Signal();
            signalCommandMap.mapSignal(startupSignal, StartupCompleteMacroCommand, true);
            startupSignal.dispatch();
        }
    }
}
