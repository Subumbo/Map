package com.ogilvy.ihg.map.view.share {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	import com.ogilvy.ihg.map.view.Button;
	import com.ogilvy.ihg.map.view.View;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.net.URLVariables;
	
	import org.osflash.signals.Signal;
	
	public class Share extends View {
		
		public var shared:Signal;
		private var _model:OverlayVO;
		private var _asset:MovieClip;
		
		public function Share(asset:MovieClip) {
			shared = new Signal(OverlayVO, int);
			_asset = asset;
			
			var fb:MovieClip = asset.facebook;
			var tw:MovieClip = asset.twitter;
			fb.buttonMode = tw.buttonMode = true;
			
			fb.addEventListener(MouseEvent.ROLL_OVER, onMouse);
			fb.addEventListener(MouseEvent.ROLL_OUT, onMouse);
			tw.addEventListener(MouseEvent.ROLL_OVER, onMouse);
			tw.addEventListener(MouseEvent.ROLL_OUT, onMouse);
			fb.addEventListener(MouseEvent.MOUSE_DOWN, onFacebook);
			tw.addEventListener(MouseEvent.MOUSE_DOWN, onTwitter);
		}
		
		
		private function onMouse(e:MouseEvent):void {
			//_asset.addChild(e.currentTarget as DisplayObject);
			switch(e.type) {
				case MouseEvent.ROLL_OVER :
					//e.currentTarget.removeEventListener(MouseEvent.ROLL_OVER, onMouse);
					//TweenMax.to(e.currentTarget, .4, {scaleX:1.2, scaleY:1.2, glowFilter:{color:0x91e600, alpha:1, blurX:30, blurY:30}});
					break;
				
				case MouseEvent.ROLL_OUT :
					//TweenMax.to(e.currentTarget, .2, {scaleX:1, scaleY:1, glowFilter:{color:0x91e600, alpha:0, blurX:30, blurY:30}});
					break;
			}
		}
		
		public function set data(val:OverlayVO):void {
			_model = val;
		}
		
		private function onFacebook(e:MouseEvent):void {
			shared.dispatch(_model, 0);
		}
		
		private function onTwitter(e:MouseEvent):void {
			shared.dispatch(_model, 1);
		}
	}
}