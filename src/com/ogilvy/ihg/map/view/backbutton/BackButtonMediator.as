package com.ogilvy.ihg.map.view.backbutton {
	import com.ogilvy.ihg.map.controller.signal.BackHomeSignal;
	import com.ogilvy.ihg.map.controller.signal.ModuleLoadedSignal;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class BackButtonMediator extends Mediator {
		
		[Inject] public var view:BackButton;
		[Inject] public var moduleLoaded:ModuleLoadedSignal;
		[Inject] public var backHomeSignal:BackHomeSignal;
		
		public override function onRegister():void {
			view.clicked.add(onClicked);
			moduleLoaded.add(view.show);
		}
		
		public override function onRemove():void {
			view.clicked.remove(onClicked);
			moduleLoaded.remove(view.show);
		}
		
		private function onClicked():void {
			backHomeSignal.dispatch();	
		}
		
	}
}