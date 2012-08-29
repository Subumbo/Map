package com.ogilvy.ihg.map.view.hotspot {
	import com.ogilvy.ihg.map.model.Lib;
	import com.ogilvy.ihg.map.model.vo.HotspotVO;
	import com.ogilvy.ihg.map.view.Button;
	import com.ogilvy.ihg.map.view.tooltip.Tooltip;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.Signal;
	
	public class Hotspot extends Button {
		
		private var _tooltip:Tooltip;
		private var _model:HotspotVO;
		
		public function Hotspot(asset:MovieClip) {
			super(asset);
			mouseChildren = false;
			buttonMode = true;
			_clicked = new Signal(HotspotVO);
			alpha = 0;
		}
		
		protected override function onRollOver(e:MouseEvent):void{
			_tooltip.show();
		}
		
		protected override function onRollOut(e:MouseEvent):void{
			_tooltip.hide();
		}
		
		protected override function onMouseDown(e:MouseEvent):void {
			_clicked.dispatch(_model);
		}
		
		public function set data(val:HotspotVO):void {
			
			_model = val;	
			addChild(_asset);
			
			this.x = val.coords.x;
			this.y = val.coords.y;
			_tooltip = new Tooltip();
			_tooltip.mouseEnabled = false;
			_tooltip.data = val.tooltip;
			addChild(_tooltip);
		}
	}
}