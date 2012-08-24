package com.ogilvy.ihg.map.view.home {
	import com.ogilvy.ihg.map.model.Lib;
	import com.ogilvy.ihg.map.model.vo.HotspotVO;
	import com.ogilvy.ihg.map.view.View;
	import com.ogilvy.ihg.map.view.hotspot.Hotspot;
	
	import org.assetloader.core.ILoader;
	import org.assetloader.loaders.DisplayObjectLoader;
	
	public class Home extends View {
		public function Home() {
			
		}
		
		public function set hotspots(val:Array):void {
			
			var i:int = val.length;
			var hotspot:Hotspot;
			while( --i > -1 ) {
				
				hotspot = new Hotspot(Lib.getMovieClip('MainHotspot'));
				hotspot.data = HotspotVO(val[i]);
				addChild(hotspot);
				
			}
			
		}
		
		public function set map(val:ILoader):void {
			
			addChild((val as DisplayObjectLoader).displayObject);
			
		}
	}
}