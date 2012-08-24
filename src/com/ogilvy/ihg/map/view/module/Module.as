package com.ogilvy.ihg.map.view.module {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.model.Lib;
	import com.ogilvy.ihg.map.model.vo.HotspotVO;
	import com.ogilvy.ihg.map.model.vo.ModuleVO;
	import com.ogilvy.ihg.map.view.hotspot.Hotspot;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import org.assetloader.loaders.DisplayObjectLoader;
	import org.osflash.signals.Signal;
	
	public class Module extends Sprite {
		
		public var hidden:Signal;
		private var _hotspotsContainer:Sprite;
		
		public function Module() {
			visible = false;	
			hidden = new Signal();
			_hotspotsContainer = new Sprite();
		}
		
		public function set data(val:ModuleVO):void {
			addChild(DisplayObjectLoader(val.map).displayObject);	
			addChild(_hotspotsContainer);
			var hotspots:Array = val.hotspots;
			var i:int = hotspots.length;
			var hotspot:Hotspot;
			var hotspotVO:HotspotVO;
			while( --i > -1 ) {
				hotspotVO = HotspotVO(hotspots[i]);
				if(hotspotVO.type == 1) {
					hotspot = new Hotspot(Lib.getMovieClip('HotelHotspot'));
				}else {
					hotspot = new Hotspot(Lib.getMovieClip('SigthHotspot'));
				}
				hotspot.data = HotspotVO(hotspots[i]);
				_hotspotsContainer.addChild(hotspot);
			}
		}
		
		public function show():void {
			TweenMax.to(this, 1, {autoAlpha:1});	
		}
		
		public function hide():void {
			TweenMax.to(this, 1, {autoAlpha:0, onComplete:hidden.dispatch});
		}
		
		public function set active(val:Boolean):void {
			if(val) {
				
			}else {
				
			}
		}
		
		public function destroy():void {
			hidden.removeAll();
			hidden = null;
		}
	}
}