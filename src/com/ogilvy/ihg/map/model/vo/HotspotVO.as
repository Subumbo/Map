package com.ogilvy.ihg.map.model.vo {
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	import org.assetloader.core.ILoader;
	
	public class HotspotVO {
		
		public var coords:Point;
		public var type:int;
		public var tooltip:TooltipVO;
		public var overlay:OverlayVO;
		
	}
}