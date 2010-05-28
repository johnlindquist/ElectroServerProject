package com.johnlindquist.multiplayer.services.data 
{
	import com.electrotank.electroserver4.esobject.EsObject;
	/**
	 * @author John Lindquist
	 */
	public class HeroUpdateData extends EsObject 
	{
		public function HeroUpdateData(x:Number, y:Number)
		{
			setFloat("x", x);
			setFloat("y", y);
		}
	}
}
