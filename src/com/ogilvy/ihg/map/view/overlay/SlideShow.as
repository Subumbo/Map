package com.ogilvy.ihg.map.view.overlay {
	import com.greensock.TweenMax;
	import com.ogilvy.ihg.map.view.View;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.assetloader.core.ILoader;
	import org.assetloader.loaders.DisplayObjectLoader;
	
	public class SlideShow extends View {
		
		private var _delay:Number = 4;
		private var _transition:Number = 4;
		private var _slides:Array;
		private var _timer:Timer;
		
		private var _old:DisplayObject;
		private var _new:DisplayObject;
		
		private var _index:int;
		
		protected function transition():void {
			_new.alpha = 0;
			addChild(_new);
			TweenMax.to(_new, _transition, {alpha:1});
			TweenMax.to(_old, _transition, {alpha:0, onComplete:function():void {
				removeChild(_old);
				_old = _new;
			}});
		}
		
		public function set transitionTime(val:Number):void {
			_transition = val;
		}
		
		public function start():void {
			if(_slides.length > 1) {
				if(!_timer) _timer = new Timer(_delay);
				else {
					_timer.delay = _delay;
					_timer.reset();
				}
				_timer.addEventListener(TimerEvent.TIMER, onTimer);
				_timer.start();
			}
		}
		
		
		public function stop():void {
			if(_timer) _timer.stop();
		}
		
		public function resume():void {
			if(_timer) _timer.start();	
		}
		
		private function onTimer(e:TimerEvent):void {
			next();
		}
		
		public function next():void {
			_index++;
			if(_index == _slides.length) _index = 0;
			_new = getSlide(_index);
			transition();
		}
		
		public function previous():void {
			_index--;
			if(_index == -1) _index = _slides.length-1;
			_new = getSlide(_index);
			transition();
		}
		
		public function set delay(val:Number):void {
			_delay = val * 1000;
		}
		
		public function set data(val:Array):void {
			_slides = val;
			if(!val || val.length == 0) throw new Error('Slideshow data corrupt. Ensure data array contains ILoader objects. Array length: ' +  val.length);
			_old = getSlide(0);
			_old.alpha = 1;
			addChild(_old);
		}
		
		private function getSlide(index:int):DisplayObject {
			return _slides ? DisplayObjectLoader(_slides[index]).displayObject : null;
		}
		
		public override function destroy():void {
			_slides = null;
			
			if(_timer) {
				_timer.removeEventListener(TimerEvent.TIMER, onTimer);
				_timer.stop();
			}
			_timer = null;
			TweenMax.killTweensOf(_old);
			if(contains(_old)) removeChild(_old);
			if(_new) {
				TweenMax.killTweensOf(_new);
				if(contains(_new)) removeChild(_new); 
			}
			_old = _new = null;
			super.destroy();
		}
	}
}