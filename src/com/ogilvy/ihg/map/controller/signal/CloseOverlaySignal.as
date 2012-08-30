package com.ogilvy.ihg.map.controller.signal {
	import org.osflash.signals.Signal;
	
	/**
	 * Signal dispatched by Overlay and mapped to CloseOverlayCommand 
	 * @author pwolleb
	 * 
	 */	
	
	public class CloseOverlaySignal extends Signal {
		public function CloseOverlaySignal() {
			super();
		}
	}
}