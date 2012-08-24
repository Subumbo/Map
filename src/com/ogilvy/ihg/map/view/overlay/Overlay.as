package com.ogilvy.ihg.map.view.overlay {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.model.Lib;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	import com.ogilvy.ihg.map.view.Button;
	import com.ogilvy.ihg.map.view.View;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	
	public class Overlay extends View {
		
		private var _asset:MovieClip;
		private var _model:OverlayVO;
		private var _cta:Button;
		private var _close:Button;
		
		public const closed:Signal = new Signal();
		
		public function Overlay() {
			
			
			
		}
		
		public function set data(val:OverlayVO):void {
			if(val.address) {
				_asset = Lib.getMovieClip('HotelOverlay');
			}else {
				_asset = Lib.getMovieClip('SightOverlay');
			}
			addChild(_asset);
			
			_asset.closeButton.addEventListener(MouseEvent.MOUSE_DOWN, onClose);
			_asset.hit.addEventListener(MouseEvent.MOUSE_DOWN, onClose);
			
			_asset.title.htmlText = val.title;
			_asset.description.htmlText = val.description;
			_asset.address.htmlText = val.address; 
		}
		
		private function onClose(e:MouseEvent):void {
			closed.dispatch();
		}
	
	}
}