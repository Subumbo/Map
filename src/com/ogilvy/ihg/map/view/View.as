package com.ogilvy.ihg.map.view {
	import com.greensock.TweenMax;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	/**
	 * Abstract base class for view components. 
	 * @author pwolleb
	 * 
	 */	
	public class View extends Sprite {
		
		protected var _shown:Signal
		protected var _hidden:Signal
		
		public function View() {
			_shown = new Signal();
			_hidden = new Signal();
		}
		
		/**
		 * Removes all references to objets to avoid memory leaks 
		 */		
		public function destroy():void {
			_shown.removeAll();
			_hidden.removeAll();
			removeListeners();
			_hidden = _shown = null;
		}
		
		/**
		 *  Plays to show animation
		 */		
		public function show():void {
			TweenMax.to(this, .5, {autoAlpha:1, onComplete:_shown.dispatch});
		}
		
		/**
		 *  Plays the hide animation 
		 */		
		public function hide():void {
			TweenMax.to(this, .5, {autoAlpha:0, onComplete:_hidden.dispatch});
		}
		
		/**
		 * Adds and removes event listsners of the component to control activity
		 * @param val
		 * 
		 */		
		public function set active(val:Boolean):void {
			(val) ? addListeners() : removeListeners();
		}
		
		/**
		 * Signal that dispatches when hidden 
		 * @return 
		 * 
		 */		
		public function get hidden():Signal {
			return _hidden;
		}
		
		/**
		 * Signal that dispatches when shown
		 * @return 
		 * 
		 */
		public function get shown():Signal {
			return _shown;
		}
		
		/** 
		 * Add event listeners here
		 */		
		protected function addListeners():void {
			
		}
		
		/** 
		 * Remove event listeners here
		 */	
		protected function removeListeners():void {
			
		}
		
		
	}
}