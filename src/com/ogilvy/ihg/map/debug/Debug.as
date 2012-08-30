package com.ogilvy.ihg.map.debug {
	import com.ogilvy.ihg.map.model.Lib;
	import com.ogilvy.ihg.map.view.View;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * Debug panel for positioning hotspots 
	 * @author pwolleb
	 * 
	 */	
	
	public class Debug extends View {
		
		private var _tf:TextField;
		
		public function Debug() {
			_tf = Lib.getMovieClip('DebugView').txt as TextField;
			addChild(_tf);
			_tf.y = 500 - _tf.height;
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void {
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMove)
		}
		
		private function onMove(e:MouseEvent):void {
			text = 'X: ' + e.stageX + '  Y: ' + e.stageY; 
		}
		
		public function set text(val:String):void {
			_tf.text = val;
		}
	}
}