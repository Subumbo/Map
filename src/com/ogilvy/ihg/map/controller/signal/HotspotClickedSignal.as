package com.ogilvy.ihg.map.controller.signal {
	import com.ogilvy.ihg.map.model.vo.HotspotVO;
	
	import org.osflash.signals.Signal;
	
	public class HotspotClickedSignal extends Signal {
		public function HotspotClickedSignal() {
			super(HotspotVO);
		}
	}
}