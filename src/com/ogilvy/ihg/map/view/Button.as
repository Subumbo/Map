package com.ogilvy.ihg.map.view {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	
	
	/**
	 * Base class for buttons can be abstract or concrete. The Asset passed has to implement a label convention. 
	 * Exmaple View can be found in ./support/Main_Assets.fla -> Library -> BackButtonView
	 * @author pwolleb
	 * 
	 */	
	public class Button extends View {
		
		protected var _clicked:Signal;
		
		protected var _asset:MovieClip;
		
		public function Button(asset:MovieClip) {
			super();
			_clicked = new Signal();
			_asset= asset
			_asset.bg.gotoAndStop('Init');
			addChild(_asset);
			mouseChildren = false;
			buttonMode = true;
			active = true;
		}
		
		protected override function addListeners():void {
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.ROLL_OVER, onRollOver);
			addEventListener(MouseEvent.ROLL_OUT, onRollOut);
		}
		
		protected override function removeListeners():void {
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			removeEventListener(MouseEvent.ROLL_OVER, onRollOver);
			removeEventListener(MouseEvent.ROLL_OUT, onRollOut);
		}
		
		protected function onMouseDown(e:MouseEvent):void {
			_clicked.dispatch();	
		}
		
		protected function onRollOver(e:MouseEvent):void {
			_asset.bg.gotoAndPlay('RollOverStart');
			Utils.addLabelScript(_asset.bg, 'Over', function():void{
				_asset.bg.gotoAndStop('Over'); 
			});		
		}
		
		protected function onRollOut(e:MouseEvent):void {
			_asset.bg.gotoAndPlay('RollOutStart');
			Utils.addLabelScript(_asset.bg, 'Out', function():void{
				_asset.bg.gotoAndStop('Init');
			});
		}
		
		public function get clicked():Signal {
			return _clicked;
		}
		
		public override function destroy():void {
			Utils.removeLabelScript(_asset.bg, 'Out');
			Utils.removeLabelScript(_asset.bg, 'Over');
			_clicked.removeAll();
			removeChild(_asset);
			_clicked = null;
			_asset = null;
			super.destroy();
		}
	}
}