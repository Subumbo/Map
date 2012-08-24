package com.ogilvy.ihg.map.controller.signal {
	import com.ogilvy.ihg.map.model.vo.ModuleVO;
	
	import org.osflash.signals.Signal;
	
	public class LoadModuleSignal extends Signal {
		public function LoadModuleSignal()
		{
			super(ModuleVO);
		}
	}
}