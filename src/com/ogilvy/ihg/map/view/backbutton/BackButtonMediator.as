package com.ogilvy.ihg.map.view.backbutton {
	import com.ogilvy.ihg.map.controller.signal.BackHomeSignal;
	
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * Mediator for module back button dispatches BackHomeSignal on click.
	 * @author pwolleb
	 * 
	 */	
	
	public class BackButtonMediator extends Mediator {
		
		[Inject] public var view:BackButton
		[Inject] public var backHomeSignal:BackHomeSignal;
		
		public override function onRegister():void {
			view.clicked.add(onClicked);
		}
		
		public override function onRemove():void {
			view.clicked.remove(onClicked);
		}
		
		private function onClicked():void {
			backHomeSignal.dispatch();	
		}
		
	}
}