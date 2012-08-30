package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.ScreenManager;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * Command changes view state to overlay. The Overlay instance itself decides wich overlay to display.
	 * @author pwolleb
	 * 
	 */	
	
	public class LoadOverlayCommand extends SignalCommand {
		
		[Inject] public var screenManager:ScreenManager;
		[Inject] public var vo:OverlayVO;
		
		public override function execute():void {
			screenManager.showOverlay(vo)
		}
		
	}
}