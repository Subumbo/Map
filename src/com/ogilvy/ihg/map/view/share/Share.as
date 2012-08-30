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
	
	/**
	 * Share View Component dipatches a shared signal containing an OverlayVO and type(int) 
	 * @author pwolleb
	 * 
	 */	
	
	public class Share extends View {
		
		public var shared:Signal;
		private var _model:OverlayVO;
		private var _asset:MovieClip;
		
		public function Share(asset:MovieClip) {
			super();
			shared = new Signal(OverlayVO, int);
			_asset = asset;	
			addListeners();
		}
		
		protected override function addListeners():void {
			var fb:MovieClip = _asset.facebook;
			var tw:MovieClip = _asset.twitter;
			fb.buttonMode = tw.buttonMode = true;
			fb.addEventListener(MouseEvent.MOUSE_DOWN, onFacebook);
			tw.addEventListener(MouseEvent.MOUSE_DOWN, onTwitter);
		}
			
		protected override function removeListeners():void {
			var fb:MovieClip = _asset.facebook;
			var tw:MovieClip = _asset.twitter;
			fb.buttonMode = tw.buttonMode = false;
			fb.removeEventListener(MouseEvent.MOUSE_DOWN, onFacebook);
			tw.removeEventListener(MouseEvent.MOUSE_DOWN, onTwitter);
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
		
		public override function destroy():void {
			shared.removeAll();
			super.destroy();
		}
	}
}