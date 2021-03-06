package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.ConfigModel;
	import com.ogilvy.ihg.map.model.Lib;
	import com.ogilvy.ihg.map.model.ScreenManager;
	import com.ogilvy.ihg.map.model.vo.HotspotVO;
	import com.ogilvy.ihg.map.model.vo.ModuleVO;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	import com.ogilvy.ihg.map.model.vo.SlideShowVO;
	import com.ogilvy.ihg.map.model.vo.TooltipVO;
	import com.ogilvy.ihg.map.view.backbutton.BackButton;
	import com.ogilvy.ihg.map.view.module.Module;
	import com.ogilvy.ihg.map.view.overlay.Overlay;
	
	import flash.geom.Point;
	
	import org.assetloader.AssetLoader;
	import org.robotlegs.mvcs.SignalCommand;
	
	/**
	 * Parses the xml data and creates VO. Initialises the ScreenManager with the home module. 
	 * Populates the config model with data from config.xml and tha swf loaderURL.
	 * @author pwolleb
	 * 
	 */	
	
	public class StartupCommand extends SignalCommand {
		
		[Inject] public var loader:AssetLoader;
		[Inject] public var screenManager:ScreenManager;
		[Inject] public var config:ConfigModel;
		
		public override function execute():void {
			var configXML:XML = XML(loader.getLoader('config').data);
			config.loaderURL = contextView.stage.loaderInfo.loaderURL;
			config.locale = configXML.item.(@key == 'locale');
			config.flashRoot = configXML.item.(@key == 'root');
			screenManager.init(parse(XML(loader.getLoader('data').data).content.module[0], String(XML(loader.getLoader('config').data).item.(@key == 'locale'))));
		}
		
		private function parse(module:XML, locale:String):ModuleVO {
			var hotspotVO:HotspotVO;
			var tooltipVO:TooltipVO;
			var overlayVO:OverlayVO;
			var moduleVO:ModuleVO;
			var slideShowVO:SlideShowVO;
			
			var hotspot:XML;
			var overlay:XML;
			var slide:XML;
			
			moduleVO = new ModuleVO();
			moduleVO.map = loader.getLoader(module.asset.@src);
			moduleVO.id = module.@id;
				
			for each(hotspot in module.hotspots.hotspot) {
				hotspotVO = new HotspotVO();
				
				tooltipVO = new TooltipVO();
				tooltipVO.position = String(hotspot.tooltip.@position);
				tooltipVO.label = hotspot.tooltip.label;
				tooltipVO.description = hotspot.tooltip.description;
				tooltipVO.thumb = loader.getLoader(String(hotspot.tooltip.asset.@src));
				tooltipVO.locale = locale;
				if(tooltipVO.description != '' && tooltipVO.thumb) {
					tooltipVO.type = 1;
				}else {
					tooltipVO.type = 0;
				}
				
				slideShowVO = new SlideShowVO();
				slideShowVO.delay = Number(hotspot.overlay.slide_show.@delay);
				slideShowVO.transitionTime = Number(hotspot.overlay.slide_show.@transition);
				for each(slide in hotspot.overlay.slide_show.asset) {
					slideShowVO.assets.push(loader.getLoader(String(slide.@src)));
				}
				
				
				
				if(hotspot.overlay.length() > 0) {
					overlay = XML(hotspot.overlay[0]);
					overlayVO = new OverlayVO();
					overlayVO.title = overlay.title;
					overlayVO.description = overlay.description;
					overlayVO.address = overlay.address;
					overlayVO.link = overlay.link;	
					overlayVO.slideShow = slideShowVO;
					hotspotVO.overlay = overlayVO;
					overlayVO.owner = hotspotVO;
				}else if(hotspot.module.length() > 0) {
				   	hotspotVO.module = parse(hotspot.module[0], locale);
					hotspotVO.module.owner = hotspotVO;
				}
				
				
				
				hotspotVO.coords = new Point(Number(hotspot.@x), Number(hotspot.@y));
				hotspotVO.type = int(hotspot.@type);
				hotspotVO.tooltip = tooltipVO;
				
				
				moduleVO.hotspots.push(hotspotVO);	
				
			}
			return moduleVO;
		}
	}
}