package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.ScreenManager;
	import com.ogilvy.ihg.map.model.vo.ModuleVO;
	import com.ogilvy.ihg.map.view.module.Module;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class LoadModuleCommand extends SignalCommand {
		
		[Inject] public var vo:ModuleVO;
		[Inject] public var screenManager:ScreenManager;
		
		public override function execute():void {
			screenManager.showModule(vo);
		}
		
	}
}