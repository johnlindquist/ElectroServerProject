package com.johnlindquist.multiplayer
{
	import com.johnlindquist.multiplayer.controller.ExisitingUsersFoundCommand;
	import com.johnlindquist.multiplayer.signals.ExisitingUsersFound;
	import com.johnlindquist.multiplayer.controller.HeroServerUpdatedCommand;
	import com.johnlindquist.multiplayer.signals.HeroServerUpdated;
	import com.johnlindquist.multiplayer.controller.HeroUpdatedCommand;
	import com.johnlindquist.multiplayer.controller.MyUserAddedCommand;
	import com.johnlindquist.multiplayer.controller.UserAddedCommand;
	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.johnlindquist.multiplayer.game.states.PlayState;
	import com.johnlindquist.multiplayer.game.states.PlayStateMediator;
	import com.johnlindquist.multiplayer.services.ElectroServerService;
	import com.johnlindquist.multiplayer.signals.HeroUpdated;
	import com.johnlindquist.multiplayer.signals.MyUserAdded;
	import com.johnlindquist.multiplayer.signals.UserAdded;
	import com.johnlindquist.multiplayer.view.FlixelGameMediator;

	import org.flixel.FlixelGame;
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
            injector.mapSingleton(GameModel);
            injector.mapSingleton(ElectroServerService);

            mediatorMap.mapView(FlixelGame, FlixelGameMediator);
            mediatorMap.mapView(PlayState, PlayStateMediator);
            
            signalCommandMap.mapSignalClass(ExisitingUsersFound, ExisitingUsersFoundCommand);
            signalCommandMap.mapSignalClass(UserAdded, UserAddedCommand);
            signalCommandMap.mapSignalClass(MyUserAdded, MyUserAddedCommand);
            signalCommandMap.mapSignalClass(HeroUpdated, HeroUpdatedCommand);
            signalCommandMap.mapSignalClass(HeroServerUpdated, HeroServerUpdatedCommand);

            var startupSignal:Signal = new Signal();
            signalCommandMap.mapSignal(startupSignal, StartupCompleteMacroCommand, true);
            startupSignal.dispatch();
        }
    }
}
