package com.ogilvy.ihg.map.debug {
	import com.ogilvy.ihg.map.model.ScreenManager;
	
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class DebugModel {
		
		[Inject] public var screenManager:ScreenManager;
		
		private var _stage:Stage;
		
		public function DebugModel(stage:Stage) {
			_stage = stage;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
		}
		
		private function onDown(e:KeyboardEvent):void {
			if(e.keyCode == Keyboard.D && e.shiftKey) {
				var debug:Debug = new Debug();
				_stage.addChild(debug);
			}
		}
	}
}