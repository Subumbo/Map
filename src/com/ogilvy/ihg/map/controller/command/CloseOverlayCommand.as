package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.ScreenManager;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class CloseOverlayCommand extends SignalCommand {
		
		[Inject] public var screenManager:ScreenManager;
		
		public override function execute():void {
		
			screenManager.hideOverlay();
			// close overlay and activate area map
		}
		
	}
}