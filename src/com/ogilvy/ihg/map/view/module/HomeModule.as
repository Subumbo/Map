package com.ogilvy.ihg.map.view.module {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.view.hotspot.Hotspot;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.setTimeout;

	/**
	 * HomeModule class implements custom aniamtion for show/hide plaus adds a intro method
	 * @author pwolleb
	 * 
	 */	
	
	public class HomeModule extends Module {
		
		private var _bitmaps:Array;
		
		/**
		 * The app intro animation  
		 * 
		 */		
		public function intro():void {
			
			//intro0();
			intro1();
		} 
		
		private function intro1():void {
			alpha = 1;
			visible = true;
			_bitmaps = [];
			const size:int = 10;
			var cols:int = 960 / size;
			var rows:int = 500 / size;
			var i:int, j:int;
			var bitmap:Bitmap;
			var bitmapData:BitmapData;
			const source:BitmapData = new BitmapData(960,500, false);
			const rect:Rectangle = new Rectangle(0,0,size, size);
			const destinantion:Point = new Point();
			source.draw(this);
			//alpha = 0;
			//visible = false;
			_map.alpha = 0;
			const container:Sprite = new Sprite();
			addChild(container);
			for(; i < cols; ++i){
				j = 0;
				for(; j < rows; ++j) {
					rect.x = i * size;
					rect.y = j * size;
					bitmapData = new BitmapData(size, size, false);
					bitmapData.copyPixels(source, rect, destinantion);
					bitmap = new Bitmap(bitmapData);
					bitmap.smoothing = true;
					bitmap.scaleX = bitmap.scaleY = .6;
					container.addChild(bitmap);
					bitmap.x = i * size;
					bitmap.y = j * size;
					TweenMax.from(bitmap, 2, {delay:1, x:430 + Math.random() * 100, y:200 + Math.random() * 100, rotationY:Math.random() * 1080 * Math.random()});
				}
			}
			
			_map.alpha = 1;
			TweenMax.to(container, 1, {colorTransform:{exposure:2}, alpha:0, delay:2.7});
			TweenMax.to(_map, 0, {colorTransform:{exposure:2}});
			TweenMax.to(_map, 1, {colorTransform:{exposure:1}, delay:2.7 ,onComplete:onIntroComplete});
		}
		
		private function intro0():void {
			visible = true;
			alpha = 1;
			TweenMax.to(_map, 0, {colorTransform:{exposure:2}});
			TweenMax.to(_map, 1, {colorTransform:{exposure:1}, onComplete:show});
		}
		
		private function onIntroComplete():void {
			
			show();
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