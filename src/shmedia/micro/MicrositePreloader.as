package shmedia.micro {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.Dictionary;
	
	import org.assetloader.AssetLoader;
	import org.assetloader.base.AssetType;
	import org.assetloader.base.Param;
	import org.assetloader.core.ILoader;
	import org.assetloader.signals.ErrorSignal;
	import org.assetloader.signals.LoaderSignal;
	
	
	
	/**
	 * Abstract preloader. Loads config.xml and locale.xml. Creates AssetLoader instance and loads all assets required for the app. 
	 * When load completes it instantiates the main app and passes the AssetLoader. 
	 * @author pwolleb
	 * 
	 */	
	
	public class MicrositePreloader extends Sprite {
		
		protected var _loader:AssetLoader;
		protected var _config:XML;
		
		public function MicrositePreloader(configURL:String) {
			_loader = new AssetLoader();
			_loader.add('config', new URLRequest(configURL), AssetType.XML);
			_loader.onChildComplete.addOnce(configLoaded);
			_loader.start();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		protected function added(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, added);
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
		}
			
		/**
		 * Callback for loader when config data is ready.
		 * Loads copt and asset xml files.
		 */		
		protected function configLoaded(signal:LoaderSignal, child:ILoader):void {
			var config:XML = _config = XML(child.data);
			var locale:String = config.item.(@key == 'locale');
			var root:String = config.item.(@key == 'root');
			if(root != "") root += "/";
			
			_loader.add('data', new URLRequest(root + 'resources/xml/' + locale + '.xml'), AssetType.XML);
			
			_loader.onError.addOnce(onErrorXML);
			_loader.onComplete.addOnce(dataLoaded);
			
			_loader.start();
		}
		
		
		protected function onErrorXML(signal:ErrorSignal):void {
			trace("XML LOAD ERROR: " + signal.message)
		}
		
		/**
		 * Callback when xml data is loaded
		 * Feeds loader with config data from assets xml 
		 * @param signal
		 * @param data
		 * 
		 */		
		protected function dataLoaded(signal:LoaderSignal, data:Dictionary):void {
			var xml:XML = XML(data['data']);
			var list:XMLList = xml..asset;
			var asset:XML;
			var url:String;
			var i:int;
			var add:Boolean;
			for each(asset in list) {
				url = asset.@src;
				i = _loader.ids.length;
				add = true;
				while( --i > -1 ) {
					if(_loader.ids[i] == url) {
						add = false;
						break;
					}
				}
				
				
				if(add) _loader.add(url, new URLRequest(url), "AUTO");
			}
			
			var context:LoaderContext = new LoaderContext();
			context.applicationDomain = ApplicationDomain.currentDomain;
			_loader.setParam(Param.LOADER_CONTEXT, context);
			
			_loader.onError.addOnce(onErrorAsset);
			_loader.onComplete.addOnce(assetsLoaded);
			
			_loader.start()
		}
		
		/**
		 * Callback when all required data and assets are loaded.  
		 * The main app is now ready and can be added to stage and initialised.
		 */		
		protected function assetsLoaded(signal:LoaderSignal, data:Dictionary):void {
			var main:Object = _loader.getLoader('Main.swf').data;
			main.init(_loader);
			stage.addChild(main as DisplayObject);
		}
			
		protected function onErrorAsset(error:ErrorSignal):void {
			trace('ASSET LOAD ERROR: ' + error.message)			
		}
	}
}