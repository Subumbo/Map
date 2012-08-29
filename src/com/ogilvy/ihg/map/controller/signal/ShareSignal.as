package com.ogilvy.ihg.map.controller.signal {
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	
	import org.osflash.signals.Signal;
	
	public class ShareSignal extends Signal {
		public function ShareSignal() {
			super(OverlayVO, int);
		}
	}
}