package com.ogilvy.ihg.map.view.module {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.model.Lib;
	import com.ogilvy.ihg.map.model.vo.HotspotVO;
	import com.ogilvy.ihg.map.model.vo.ModuleVO;
	import com.ogilvy.ihg.map.view.View;
	import com.ogilvy.ihg.map.view.hotspot.Hotspot;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.setTimeout;
	
	import org.assetloader.loaders.DisplayObjectLoader;
	import org.osflash.signals.Signal;
	
	/**
	 * Module view component holds the map background MovieClip and the Hotspots 
	 * @author pwolleb
	 * 
	 */	
	
	public class Module extends View {
		
		protected var _hotspotsContainer:Sprite;
		
		protected var _map:Map;
		
		public function Module() {
			visible = false;
			alpha = 0;
			_hotspotsContainer = new Sprite();
		}
		
		/**
		 * Populates the view with the model(ModuleVO). Adds the map and hotspots to itself.
		 * @param val
		 * 
		 */		
		public function set data(val:ModuleVO):void {
			_map = new Map(MovieClip(DisplayObjectLoader(val.map).displayObject));
			addChild(_map);	
			addChild(_hotspotsContainer);
			var hotspots:Array = val.hotspots;
			
			var hotspot:Hotspot;
			var hotspotVO:HotspotVO;
			var l:int = hotspots.length;
			var i:int;
			for(; i < l; ++i) {
				hotspotVO = HotspotVO(hotspots[i]);
				if(hotspotVO.type == 0) {
					hotspot = new Hotspot(Lib.getMovieClip('MainHotspot'));
				} else if(hotspotVO.type == 1) {
					hotspot = new Hotspot(Lib.getMovieClip('HotelHotspot'));
				}else {
					hotspot = new Hotspot(Lib.getMovieClip('SigthHotspot'));
				}
				hotspot.data = HotspotVO(hotspots[i]);
				_hotspotsContainer.addChild(hotspot);
			}
			
		}
		
		/**
		 * 
		 * Shows the modules map and animates-in the hotspots
		 */	
		public override function show():void {
			scaleX = scaleY = 0.8, 
			x = 960 * .2 * .5;
			y = 500 * .2 * .5;
			TweenMax.to(this, .4, {autoAlpha:1, transformMatrix:{x: 0, y:0, scaleX:1, scaleY:1}, onComplete:_shown.dispatch});
			var l:int = _hotspotsContainer.numChildren;
			setTimeout(_map.showRoute, l * 100 + 400);
			var i:int;
			for(; i < l; ++i) {
				setTimeout(Hotspot(_hotspotsContainer.getChildAt(i)).show, i * 100 + 400);
			}
		}
		
		
		/**
		 * Hides the module
		 * 
		 */		
		public override function hide():void {
			TweenMax.to(this, .4, {autoAlpha:0, transformMatrix:{x: 960 * .2 * .5, y:500 * .2 * .5, scaleX:.8, scaleY:.8}, onComplete:_hidden.dispatch});
			var i:int = _hotspotsContainer.numChildren;
			_map.hideRoute();
			while( --i > -1 ) {
				Hotspot(_hotspotsContainer.getChildAt(i)).hide();
			}
		}
		
		public override function destroy():void {
			var i:int = _hotspotsContainer.numChildren;
			var hotspot:Hotspot;
			while( --i > -1 ) {
				hotspot = Hotspot(_hotspotsContainer.removeChildAt(i));
				setTimeout(hotspot.destroy,1);;
			}
			if(_map) {
				removeChild(_map);
				_map = null;
				removeChild(_hotspotsContainer);
				_hotspotsContainer = null;
			}
			super.destroy();
		}

	}
}