package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.ScreenManager;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class BackHomeCommand extends SignalCommand {
		
		[Inject] public var screenManager:ScreenManager;
		
		public override function execute():void {
			screenManager.showHome();
			// transisiton to main map 
			// destroy module
			// release command
		}
		
	}
}