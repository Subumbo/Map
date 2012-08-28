package com.ogilvy.ihg.map.view.module {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.view.hotspot.Hotspot;

	public class HomeModule extends Module {
		
		public override function show():void {
			TweenMax.to(this, 1, {autoAlpha:1, onComplete:function():void {
				
			}});
		}
		
	}
}