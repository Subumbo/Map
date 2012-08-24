package com.ogilvy.ihg.map {
	import com.ogilvy.ihg.map.controller.MicrositeContext;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.assetloader.AssetLoader;
	
	public class Main extends Sprite {
		
		
		private var _context:MicrositeContext;
		private var _loader:AssetLoader;
		
		
		public function init(loader:AssetLoader=null):void {			
			
			if(!loader) {
				// running without preloader --> assets need loading
			}else {
				// running with Preloader
				_loader = loader;
				if(!stage) addEventListener(Event.ADDED_TO_STAGE, startup);
				else startup();
			}
		}
		
		private function startup(e:Event=null):void {
			
			if(e) removeEventListener(Event.ADDED_TO_STAGE, startup);
			_context = new MicrositeContext(_loader, stage)	
		}
	}
}