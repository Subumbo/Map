package com.ogilvy.ihg.map.view.overlay {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.model.Lib;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class Overlay extends Sprite {
		
		private var _asset:MovieClip;
		private var _model:OverlayVO;
		
		public function Overlay() {
			cacheAsBitmap = true;
					
		}
		
		public function set data(val:OverlayVO):void {
			if(val.address) {
				_asset = Lib.getMovieClip('HotelOverlay');
			}else {
				_asset = Lib.getMovieClip('SightOverlay');
			}
			addChild(_asset);
			
			_asset.title.htmlText = val.title;
			_asset.description.htmlText = val.description;
			_asset.address.htmlText = val.address; 
		}
		
		public function show():void {
			scaleX = scaleY = .9;
			alpha = 0;
			TweenMax.to(this, .5, {autoAlpha:1, scaleX:1, scaleY:1});
		}
		
		public function hide():void {
			
		}
	}
}