package com.ogilvy.ihg.map.view.module {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.view.Button;
	import com.ogilvy.ihg.map.view.View;
	
	import flash.display.MovieClip;
	
	/**
	 * Map 
	 * @author pwolleb
	 * 
	 */	
	
	public class Map extends View {
		
		private var _asset:MovieClip
		
		public function Map(asset:MovieClip) {
			_asset = asset;
			addChild(asset);
			if(asset.route) {
				asset.route.alpha = 0;
			}
		}
		
		public function showRoute():void {
			if(_asset.route) {
				TweenMax.to(_asset.route, .5, {alpha:1});
			}
		}
		
		public function hideRoute():void {
			if(_asset.route) {
				TweenMax.to(_asset.route, .5, {alpha:0});
			}
		}
		
	}
}