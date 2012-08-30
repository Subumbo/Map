package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	import com.ogilvy.ihg.map.service.FacebookShareService;
	import com.ogilvy.ihg.map.service.ShareService;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	public class ShareCommand extends SignalCommand {
		
		[Inject] public var facebookService:FacebookShareService;
		[Inject] public var shareService:ShareService;
		[Inject] public var vo:OverlayVO;
		[Inject] public var type:int;
		
		public override function execute():void {
			switch(type) {
				
				case 0 :
					facebookService.send(vo.link, vo.title, vo.description, 'file://localhost/Users/pwolleb/WORK/IHG_Map/bin/resources/images/thumb.jpg');
					break;
				
				case 1 :
					shareService.send(vo.link, vo.title, vo.description);
					break;
				
			}
		}
		
	}
}