package com.ogilvy.ihg.map {
	import com.ogilvy.ihg.map.controller.MicrositeContext;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.assetloader.AssetLoader;
	
	/**
	 * Main app get initialised by the prelaoder and passed the AssetLoader. On startup the Robotlegs Context is created with passing an instance of AssetLoader containing data and asset for the app to initialise.
	 * @author pwolleb
	 * 
	 */	
	
	public class Main extends Sprite {
		
		private var _context:MicrositeContext;
		private var _loader:AssetLoader;
		
		/**
		 * Call from Preloader. AssetLoader needs to have fully loaded all necessary asset for startup. 
		 * @param loader
		 * 
		 */		
		public function init(loader:AssetLoader):void {			
			_loader = loader;
			if(!stage) addEventListener(Event.ADDED_TO_STAGE, startup);
			else startup();
		}
		
		private function startup(e:Event=null):void {
			if(e) removeEventListener(Event.ADDED_TO_STAGE, startup);
			_context = new MicrositeContext(_loader, stage)	
		}
	}
}