package com.ogilvy.ihg.map.controller
{
	import com.ogilvy.ihg.map.controller.command.StartupCommand;
	
	import flash.display.DisplayObjectContainer;
	
	import org.assetloader.AssetLoader;
	import org.robotlegs.mvcs.SignalContext;
	
	public class MicrositeContext extends SignalContext {
		
		private var _loader:AssetLoader;
		
		public function MicrositeContext(loader:AssetLoader, contextView:DisplayObjectContainer=null, autoStartup:Boolean=true) {
			_loader = loader;
			super(contextView, autoStartup);
		}
		
		public override function startup():void {
			super.startup();
			
			injector.mapValue(AssetLoader, _loader);
			trace('HERE');
			commandMap.execute(StartupCommand);
		}
	}
}