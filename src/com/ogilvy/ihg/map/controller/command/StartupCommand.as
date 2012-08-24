package com.ogilvy.ihg.map.controller.command {
	import com.ogilvy.ihg.map.model.Lib;
	import com.ogilvy.ihg.map.model.ScreenManager;
	import com.ogilvy.ihg.map.model.StateModel;
	import com.ogilvy.ihg.map.model.vo.HotspotVO;
	import com.ogilvy.ihg.map.model.vo.ModuleVO;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	import com.ogilvy.ihg.map.model.vo.SlideShowVO;
	import com.ogilvy.ihg.map.model.vo.TooltipVO;
	import com.ogilvy.ihg.map.view.backbutton.BackButton;
	import com.ogilvy.ihg.map.view.home.Home;
	import com.ogilvy.ihg.map.view.overlay.Overlay;
	
	import flash.geom.Point;
	
	import org.assetloader.AssetLoader;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class StartupCommand extends SignalCommand {
		
		[Inject] public var loader:AssetLoader;
		[Inject] public var stateModel:StateModel;
		[Inject] public var screenManager:ScreenManager;
		
		private var _modules:Array;
		private var _mainHotspots:Array;
		private var _homeModule:ModuleVO;
		
		public override function execute():void {
			signalCommandMap.detain(this);
			
			// parse copy to Model.parse
			parse();
			
			// TO DO : populate state model
			
			// create view template instances
			createView();
			
			// hook up interactions
			// hide preloader
			// show initial state
			// release command
		}
		
		private function createView():void {
			var home:Home = new Home();
			home.map = _homeModule.map
			home.hotspots = _mainHotspots;
			
			var backButton:BackButton = new BackButton(Lib.getMovieClip('BackButtonView'));
			
			var overlay:Overlay = new Overlay();
			
			screenManager.init(home, backButton, overlay);
		}
		
		private function parse():void {
			var modules:Array = [];
			_mainHotspots = [];
			_homeModule = new ModuleVO();
			
			var hotspotVO:HotspotVO;
			var tooltipVO:TooltipVO;
			var overlayVO:OverlayVO;
			var moduleVO:ModuleVO;
			var slideShowVO:SlideShowVO;
			
			var locale:String = String(XML(loader.getLoader('config').data).item.(@key == 'locale'));
			
			var xml:XML = XML(loader.getLoader('data').data);
			
		
			_homeModule.map = loader.getLoader('resources/images/main_map.jpg'); 
			
			var module:XML;
			var hotspot:XML;
			var slide:XML;
			var i:int;
			for each(module in xml..module) {
				i = 0;
				moduleVO = new ModuleVO();
				moduleVO.map = loader.getLoader(module.asset.@src);
				moduleVO.id = module.@id;
				for each(hotspot in module..hotspot) {
					
					tooltipVO = new TooltipVO();
					tooltipVO.position = String(hotspot.tooltip.@position);
					tooltipVO.label = hotspot.tooltip.label;
					tooltipVO.description = hotspot.tooltip.description;
					tooltipVO.thumb = loader.getLoader(String(hotspot.tooltip.asset.@src));
					tooltipVO.locale = locale;
					
					slideShowVO = new SlideShowVO();
					slideShowVO.delay = Number(hotspot.overlay.slide_show.@delay);
					for each(slide in hotspot.overlay.slide_show.asset) {
						slideShowVO.assets.push(slide);
					}
					
					overlayVO = new OverlayVO();
					overlayVO.title = hotspot.overlay.title;
					overlayVO.description = hotspot.overlay.description;
					overlayVO.address = hotspot.overlay.address;
					overlayVO.link = hotspot.overlay.link;	
					overlayVO.slideShow = slideShowVO;
					
					
					hotspotVO = new HotspotVO();
					hotspotVO.coords = new Point(Number(hotspot.@x), Number(hotspot.@y));
					hotspotVO.type = int(hotspot.@type);
					hotspotVO.tooltip = tooltipVO;
					hotspotVO.overlay = overlayVO;
					
					if(i == 0) {
						hotspotVO.module = moduleVO;
						_mainHotspots.push(hotspotVO);
					}else {
						moduleVO.hotspots.push(hotspotVO);	
					}
					i++;
					
					
				}
			}
		}
		
		private function release():void {
			signalCommandMap.release(this);
		}
	}
}