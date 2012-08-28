package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.controller.signal.LoadOverlaySignal;
	import com.ogilvy.ihg.map.controller.signal.LoadModuleSignal;
	import com.ogilvy.ihg.map.model.vo.HotspotVO;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class HotspotClickedCommand extends SignalCommand {
		
		[Inject] public var vo:HotspotVO;
		[Inject] public var loadModuleSignal:LoadModuleSignal;
		[Inject] public var loadOverlaySignal:LoadOverlaySignal;
		
		public override function execute():void {
			if(vo.module) {
				loadModuleSignal.dispatch(vo.module);
			}else if(vo.overlay) {
				loadOverlaySignal.dispatch(vo.overlay);
			}
		
		}
		
	}
}