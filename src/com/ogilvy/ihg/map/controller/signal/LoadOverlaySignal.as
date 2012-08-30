package com.ogilvy.ihg.map.controller.signal {
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Signal holding a OverlayVO dispatched by HospotClickedCommand and mapped to LoadOverlayCommand.
	 * @author pwolleb
	 * 
	 */	
	
	public class LoadOverlaySignal extends Signal {
		public function LoadOverlaySignal() {
			super(OverlayVO);
		}
	}
}