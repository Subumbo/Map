package com.ogilvy.ihg.map.controller.signal {
	import com.ogilvy.ihg.map.model.vo.HotspotVO;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Signal holding a HotspotVO dispatched by a Hotspot and mapped to HotspotClickedCommand.
	 * @author pwolleb
	 * 
	 */	
	
	public class HotspotClickedSignal extends Signal {
		public function HotspotClickedSignal() {
			super(HotspotVO);
		}
	}
}