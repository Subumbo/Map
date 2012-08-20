package com.ogilvy.ihg.map.view.overlay {
	import org.robotlegs.mvcs.Mediator;
	
	public class OverlayMediator extends Mediator {
		
		[Inject] public var view:Overlay;
		
		public override function onRegister():void {
			
		}
	}
}