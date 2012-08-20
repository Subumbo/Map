package com.ogilvy.ihg.map.controller.command {
	import org.robotlegs.mvcs.SignalCommand;
	
	public class HotspotClickedCommand extends SignalCommand {
		
		public override function execute():void {
			// Decide what hotspot was clicked and then load: Overlay or area module
		}
		
	}
}