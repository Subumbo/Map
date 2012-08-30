package com.ogilvy.ihg.map.view.hotspot {
	import com.ogilvy.ihg.map.controller.signal.HotspotClickedSignal;
	import com.ogilvy.ihg.map.model.vo.HotspotVO;
	
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * Mediator for Hotspot view dispatches HotspotClickedSignal on click.
	 * @author pwolleb
	 * 
	 */
	public class HotspotMediator extends Mediator {
		
		[Inject] public var view:Hotspot;
		[Inject] public var loadModuleSignal:HotspotClickedSignal;
		
		public override function onRegister():void {
			view.clicked.add(onClicked);
		}
		
		private function onClicked(vo:HotspotVO):void {
			loadModuleSignal.dispatch(vo);
		}
		
	}
}