package com.ogilvy.ihg.map.controller.signal {
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	
	import org.osflash.signals.Signal;
	
	public class LoadOverlaySignal extends Signal {
		public function LoadOverlaySignal() {
			super(OverlayVO);
		}
	}
}