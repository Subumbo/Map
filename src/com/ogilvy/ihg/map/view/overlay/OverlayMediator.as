package com.ogilvy.ihg.map.view.overlay {
	import com.ogilvy.ihg.map.controller.signal.CloseOverlaySignal;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class OverlayMediator extends Mediator {
		
		[Inject] public var view:Overlay;
		[Inject] public var closeOverlaySignal:CloseOverlaySignal;
		
		public override function onRegister():void {
			view.closed.addOnce(closeOverlaySignal.dispatch);
		}
	}
}