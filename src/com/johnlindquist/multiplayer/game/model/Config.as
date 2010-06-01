package com.johnlindquist.multiplayer.game.model 
{
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flight.net.Response;
	import flight.net.IResponse;
	/**
	 * @author John Lindquist
	 */
	public class Config 
	{
		public var properties:Object = {};
		
		public function load(path:String):IResponse 
		{
			var response:Response = new Response();
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onLoaderComplete);
			response.addCompleteEvent(loader, Event.COMPLETE);
			
			loader.load(new URLRequest(path));
						
			return response;
		}

		private function onLoaderComplete(event:Event):void 
		{
			var loader:URLLoader = URLLoader(event.target);
			var children:XMLList = new XML(loader.data).children();
			var properties:Object = {};
			for each (var child:XML in children) {
				properties[child.name()] = child;
			}
			this.properties = properties;
		}
	}
}
