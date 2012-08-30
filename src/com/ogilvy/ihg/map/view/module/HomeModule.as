package com.ogilvy.ihg.map.view.module {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.view.hotspot.Hotspot;
	
	import flash.utils.setTimeout;

	/**
	 * HomeModule class implements custom aniamtion for show/hide plaus adds a intro method
	 * @author pwolleb
	 * 
	 */	
	
	public class HomeModule extends Module {
		
		/**
		 * The app intro animation  
		 * 
		 */		
		public function intro():void {
			alpha = 1;
			visible = true;
			TweenMax.to(this, 0, {colorTransform:{exposure:2}});
			TweenMax.to(this, 1, {colorTransform:{exposure:1}, onComplete:show});
		} 
		
		public override function hide():void {
			var i:int = _hotspotsContainer.numChildren;
			while( --i > -1 ) {
				Hotspot(_hotspotsContainer.getChildAt(i)).hide();
			}
		}
		
		public override function show():void {
			var i:int = _hotspotsContainer.numChildren;
			while( --i > -1 ) {
				setTimeout(Hotspot(_hotspotsContainer.getChildAt(i)).show, i * 100);
			}
		}
		
	}
}