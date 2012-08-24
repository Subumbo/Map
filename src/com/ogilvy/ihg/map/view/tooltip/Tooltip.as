package com.ogilvy.ihg.map.view.tooltip {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.model.Lib;
	import com.ogilvy.ihg.map.model.vo.TooltipVO;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class Tooltip extends Sprite {
		public function Tooltip() {
			
		}
		
		public function set data(val:TooltipVO):void {
			var id:String = 'TooltipSimpleTR';
			var asset:MovieClip = Lib.getMovieClip(id);
			asset.label.autoSize = 'left';
			asset.label.htmlText = val.label;
			asset.bg.width = asset.label.width + 18;
			addChild(asset);
			visible = false;
		}
		
		public function show():void {
			alpha = 0;
			TweenMax.to(this, .5, {autoAlpha:1});
		}
		
		public function hide():void {
			TweenMax.to(this, .5, {autoAlpha:0});
		}
	}
}