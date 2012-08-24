package com.ogilvy.ihg.map.view.hotspot {
	import com.ogilvy.ihg.map.controller.signal.HotspotClickedSignal;
	import com.ogilvy.ihg.map.model.vo.HotspotVO;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class HotspotMediator extends Mediator {
		
		[Inject] public var view:Hotspot;
		[Inject] public var loadModuleSignal:HotspotClickedSignal;
		
		public override function onRegister():void {
			view.clicked.add(onClicked);
		}
		
		private function onClicked(vo:HotspotVO):void {
			trace('MODULE');
			loadModuleSignal.dispatch(vo);
		}
		
		public override function onRemove():void {
			view.clicked.removeAll();
		}
		
	}
}