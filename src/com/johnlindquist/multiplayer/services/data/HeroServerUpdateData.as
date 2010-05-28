package com.johnlindquist.multiplayer.services.data 
{
	/**
	 * @author John Lindquist
	 */
	public class HeroServerUpdateData extends Object 
	{
		public var id:String;
		public var x:Number;
		public var y:Number;
		
		public function HeroServerUpdateData(id:String, x:Number, y:Number)
		{
			this.id = id;
			this.x = x;
			this.y = y;	
		}
	}
}
