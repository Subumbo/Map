package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.ScreenManager;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * Command closes overaly and changes view state to either home or area view. 
	 * @author pwolleb
	 * 
	 */	
	
	public class CloseOverlayCommand extends SignalCommand {
		
		[Inject] public var screenManager:ScreenManager;
		
		public override function execute():void {
		
			screenManager.hideOverlay();
			// close overlay and activate area map
		}
		
	}
}