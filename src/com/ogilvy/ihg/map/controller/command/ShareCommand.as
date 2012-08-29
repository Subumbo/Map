package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	import com.ogilvy.ihg.map.service.FacebookShareService;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class ShareCommand extends SignalCommand {
		
		[Inject] public var facebookService:FacebookShareService;
		[Inject] public var vo:OverlayVO;
		[Inject] public var type:int;
		
		public override function execute():void {
			trace('SAHRE COMMAND');
			switch(type) {
				
				case 0 :
					facebookService.send(vo.link, vo.title, vo.description, 'file://localhost/Users/pwolleb/WORK/IHG_Map/bin/resources/images/thumb.jpg');
					break;
				
				case 0 :
					facebookService.send(vo.link, vo.title, vo.description);
					break;
				
			}
		}
		
	}
}