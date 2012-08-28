package com.ogilvy.ihg.map.view.overlay {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.model.Lib;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	import com.ogilvy.ihg.map.view.Button;
	import com.ogilvy.ihg.map.view.View;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import org.osflash.signals.Signal;
	
	public class Overlay extends View {
		
		private var _asset:MovieClip;
		private var _model:OverlayVO;
		private var _cta:Button;
		private var _close:Button;
		
		public var closed:Signal;
		
		public function Overlay() {
			alpha = 0;
			closed = new Signal();
		}
		
		public function set data(val:OverlayVO):void {
			_model = val;
			if(val.address) {
				_asset = Lib.getMovieClip('HotelOverlay');
				_cta = new Button(_asset.cta);
				_cta.clicked.add( function():void {
				 	navigateToURL(new URLRequest(_model.link), '_blank' );
				});
				_asset.addChild(_cta);
				_asset.address.htmlText = val.address; 

			}else {
				_asset = Lib.getMovieClip('SightOverlay');
			}
			
			addChild(_asset);
			
			_close = new Button(_asset.closeButton);
			_close.clicked.add(closed.dispatch);
			_asset.addChild(_close);
			
						
			_asset.hit.addEventListener(MouseEvent.MOUSE_DOWN, onClose);
			
			_asset.title.htmlText = val.title;
			_asset.description.htmlText = val.description;
			
		}
		
		private function onClose(e:MouseEvent):void {
			closed.dispatch();
		}
		
		public override function destroy():void {
			_close.destroy();
			_asset.removeChild(_close);
			_asset.hit.removeEventListener(MouseEvent.MOUSE_DOWN, onClose);
			closed.removeAll();
			closed = null;
			_asset = null;
			_close = null;
			if(_cta) _cta.destroy();
			_cta = null;
			super.destroy();
		}
	}
}