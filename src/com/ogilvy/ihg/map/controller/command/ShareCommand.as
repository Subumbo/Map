package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.ConfigModel;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	import com.ogilvy.ihg.map.service.FacebookShareService;
	import com.ogilvy.ihg.map.service.ShareService;
	
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * Calls the correct share service. Either Facebook or AddThis.
	 * @author pwolleb
	 * 
	 */	
	
	public class ShareCommand extends SignalCommand {
		
		[Inject] public var facebookService:FacebookShareService;
		[Inject] public var shareService:ShareService;
		[Inject] public var vo:OverlayVO;
		[Inject] public var type:int;
		[Inject] public var config:ConfigModel;
		
		public override function execute():void {
			switch(type) {
				
				case 0 :
					var base:String = config.loaderURL.substr(0, config.loaderURL.lastIndexOf('/') + 1);;
					if(config.flashRoot != '') base += '/' + config.flashRoot + '/';
					facebookService.send(vo.link, vo.title, vo.description, base + vo.owner.tooltip.thumb.id);
					break;
				
				case 1 :
					shareService.send(vo.link, vo.title, vo.description);
					break;
				
			}
		}
		
	}
}