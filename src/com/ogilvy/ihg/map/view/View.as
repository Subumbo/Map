package com.ogilvy.ihg.map.view {
	import com.greensock.TweenMax;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;

	public class View extends Sprite {
		
		protected var _shown:Signal
		protected var _hidden:Signal
		
		public function View() {
			_shown = new Signal();
			_hidden = new Signal();
		}
		
		public function destroy():void {
			_shown.removeAll();
			_hidden.removeAll();
			removeListeners();
			_hidden = _shown = null;
		}
		
		public function show():void {
			TweenMax.to(this, .5, {autoAlpha:1, onComplete:_shown.dispatch});
		}
		
		public function hide():void {
			TweenMax.to(this, .5, {autoAlpha:1, onComplete:_hidden.dispatch});
		}
		
		public function set active(val:Boolean):void {
			(val) ? addListeners() : removeListeners();
		}
		
		public function get hidden():Signal {
			return _hidden;
		}
		
		public function get shown():Signal {
			return _shown;
		}
		
		protected function addListeners():void {
			
		}
		
		protected function removeListeners():void {
			
		}
		
		
	}
}