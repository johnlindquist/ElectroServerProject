package com.johnlindquist.multiplayer.game.states{	import com.electrotank.electroserver4.user.User;
	import com.johnlindquist.multiplayer.signals.MyUserAdded;
	import flight.binding.Bind;
	import com.johnlindquist.multiplayer.game.heroes.MyHero;	import com.johnlindquist.multiplayer.game.model.GameModel;	import com.johnlindquist.multiplayer.signals.HeroUpdated;	import org.robotlegs.mvcs.Mediator;	/**	 * @author John Lindquist	 */	public class PlayStateMediator extends Mediator	{		[Inject]		public var view:PlayState;		[Inject]		public var gameModel:GameModel;		[Inject]		public var heroUpdated:HeroUpdated;		[Inject]		public var myUserAdded:MyUserAdded;				override public function onRegister():void		{			view.heroUpdated.add(onHeroUpdated);						myUserAdded.add(onMyUserAdded);						Bind.addBinding(view, "heroes", gameModel, "heroes");		}		private function onMyUserAdded(user:User):void 		{			view.myHero = gameModel.myHero;
		}
		private function onHeroUpdated(myHero:MyHero):void 		{			heroUpdated.dispatch(myHero);		
		}
	}}