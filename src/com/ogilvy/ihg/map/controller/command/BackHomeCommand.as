package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.ScreenManager;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * Command changes view state to home 
	 * @author pwolleb
	 * 
	 */	
	
	public class BackHomeCommand extends SignalCommand {
		
		[Inject] public var screenManager:ScreenManager;
		
		public override function execute():void {
			screenManager.hideModule();
		}
		
	}
}