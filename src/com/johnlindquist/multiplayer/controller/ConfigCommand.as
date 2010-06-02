package com.johnlindquist.multiplayer.controller 
{
	import com.johnlindquist.multiplayer.game.model.GameModel;
	import com.johnlindquist.multiplayer.game.model.Config;
	import flight.domain.AsyncCommand;
	/**
	 * @author John Lindquist
	 */
	public class ConfigCommand extends AsyncCommand 
	{
		[Inject(id = "config")]
		public var path:String;
		
		[Inject]
		public var config:Config;
		
		[Inject]
		public var gameModel:GameModel;
		
		override public function execute():void 
		{
			gameModel.status = gameModel.LOADING_CONFIG;
			response = config.load(path);	
		}
	}
}
