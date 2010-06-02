package com.johnlindquist.multiplayer.controller 
{
	import flight.domain.Command;

	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.johnlindquist.multiplayer.game.states.MenuState;
	import com.johnlindquist.multiplayer.game.states.PlayState;
	/**
	 * @author John Lindquist
	 */
	public class StateChangedCommand extends Command 
	{
		[Inject]
		public var gameModel:GameModel;
		
		override public function execute():void 
		{
			switch(gameModel.state)
			{
				case MenuState:
					gameModel.state = PlayState;
					break;
			}
		}
	}
}
