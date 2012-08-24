package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.ScreenManager;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class LoadOverlayCommand extends SignalCommand {
		
		[Inject] public var screenManager:ScreenManager;
		[Inject] public var vo:OverlayVO;
		
		public override function execute():void {
			
			trace('SHOW OVERLAY');
			
			screenManager.showOverlay(vo)
			// load hotel overlay assets
			// populate
			// transition to overlay
			// release command
		}
		
	}
}