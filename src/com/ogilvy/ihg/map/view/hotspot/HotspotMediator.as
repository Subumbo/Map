package com.ogilvy.ihg.map.view.hotspot {
	import org.robotlegs.mvcs.Mediator;
	
	public class HotspotMediator extends Mediator {
		
		[Inject] public var view:Hotspot;
		
		public override function onRegister():void {
			// Populate with data and hook up interactions
		}
		
	}
}