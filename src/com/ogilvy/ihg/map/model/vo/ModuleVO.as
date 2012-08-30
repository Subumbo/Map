package com.ogilvy.ihg.map.model.vo {
	
	import org.assetloader.core.ILoader;

	/**
	 * Module Value Object 
	 * @author pwolleb
	 * 
	 */	
	
	public class ModuleVO {
		public var id:String;
		public var hotspots:Array = [];
		public var map:ILoader;
		public var owner:HotspotVO;
	}
}