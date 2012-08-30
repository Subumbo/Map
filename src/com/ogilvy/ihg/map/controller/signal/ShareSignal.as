package com.ogilvy.ihg.map.controller.signal {
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Signal holding a OverlayVO and int ( type of share site ) dispatched by ShareMediator and mapped to ShareCommand.
	 * @author pwolleb
	 * 
	 */	
	
	public class ShareSignal extends Signal {
		public function ShareSignal() {
			super(OverlayVO, int);
		}
	}
}