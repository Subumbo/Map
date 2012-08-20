package com.ogilvy.ihg.map.controller.command {
	import org.assetloader.AssetLoader;
	import org.robotlegs.mvcs.SignalCommand;
	
	public class StartupCommand extends SignalCommand {
		
		[Inject] public var loader:AssetLoader;
		
		public override function execute():void {
			trace("HERE", loader);
			// parse copy to Model.parse
			// populate state model
			// create view template instances
			// hook up interactions
			// hide preloader
			// show initial state
			// release command
		}
		
	}
}