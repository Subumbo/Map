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
			
			var type:String = 'Complex';
			var position:String = val.position.toUpperCase();
			
			var id:String = 'Tooltip' + type + position;
			var asset:MovieClip = Lib.getMovieClip(id);
			
			if(type == 'Simple') {
				if(position == 'TR' || position == 'BR') {
					asset.label.autoSize = 'left';
				}else {
					asset.label.autoSize = 'right';
				}
				asset.label.htmlText = val.label;
				asset.bg.width = asset.label.width + 17;
			}else {
				if(position == 'TR' || position == 'BR') {
					asset.label.autoSize = 'left'
				}else {
					asset.label.autoSize = 'right'
				}
				asset.label.htmlText = val.label;
				asset.bg.width = asset.label.width + 7 + asset.label.x;
				
				asset.description.htmlText = val.description;
				if(asset.label.width < asset.description.width) {
					asset.bg.width = asset.description.width + 8 + asset.description.x;
				}else {
					asset.description.width = asset.label.width;
				}
			}
			
			addChild(asset);
			
			visible = false;
		}
		
		
		
		public function show():void {
			alpha = 0;
			TweenMax.to(this, .5, {autoAlpha:1});
		}
		
		public function hide():void {
			TweenMax.to(this, .2, {autoAlpha:0});
		}
	}
}