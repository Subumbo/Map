package com.ogilvy.ihg.map.view.share {
	import com.ogilvy.ihg.map.controller.signal.ShareSignal;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * Dispatches ShareSignal on share icon click.
	 * @author pwolleb
	 * 
	 */	
	public class ShareMediator extends Mediator {
		
		[Inject] public var view:Share;
		[Inject] public var shareSignal:ShareSignal;
		
		public override function onRegister():void {
			view.shared.add(onShare);
		}
		
		private function onShare(overlayVO:OverlayVO, type:int):void {
			shareSignal.dispatch(overlayVO, type);
		}
		
	}
}