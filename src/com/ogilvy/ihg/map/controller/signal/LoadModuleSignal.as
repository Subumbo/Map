package com.ogilvy.ihg.map.controller.signal {
	import com.ogilvy.ihg.map.model.vo.ModuleVO;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Signal holding a ModuleVO dispatched by a HotspotClickedCommand and mapped to LoadModuleCommand.
	 * @author pwolleb
	 * 
	 */	
	
	public class LoadModuleSignal extends Signal {
		public function LoadModuleSignal() {
			super(ModuleVO);
		}
	}
}