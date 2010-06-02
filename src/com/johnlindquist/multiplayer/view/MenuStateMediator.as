package com.johnlindquist.multiplayer.view 
{
	import flight.binding.Bind;

	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.johnlindquist.multiplayer.game.states.MenuState;
	import com.johnlindquist.multiplayer.signals.StateChanged;

	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author John Lindquist
	 */
	public class MenuStateMediator extends Mediator 
	{
		[Inject]
		public var menuState:MenuState;
		
		[Inject]
		public var stateChanged:StateChanged;
		
		[Inject]
		public var gameModel:GameModel;
				
		override public function onRegister():void 
		{
			menuState.startClicked.add(onStartClicked);		
			Bind.addBinding(menuState.startText, "text", gameModel, "status");	
		}

		private function onStartClicked():void 
		{
			if(menuState.startText.text == gameModel.CLICK_TO_START) 
			{
				stateChanged.dispatch();
			}
		}
	}
}
