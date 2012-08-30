package com.ogilvy.ihg.map {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import org.assetloader.core.ILoader;
	import org.assetloader.signals.LoaderSignal;
	import org.assetloader.signals.ProgressSignal;
	
	import shmedia.micro.MicrositePreloader;
	
	/**
	 * Preloader hooks up the view asset with the preloader controller (MicrositePreloader.as which is the base class).
	 * Designer can design the preloader_asset.swf in the .fla (./support/Preloader_Asset/Preloader_Asset.fla). Once design is finished the swf needs to be compiled into the preloader via the flex compiler.
	 */	
	
	[SWF(width='960', height='500', backgroundColor='#ffffff', frameRate='30')]
	public class Preloader extends MicrositePreloader {
		
		[Embed(source="assets/preloader_asset.swf", symbol="PreloaderAsset")]
		private var Asset:Class;
		
		private var _asset:Object;
		
		private const LOADING_LABEL:String = "Loading:";
		
		public function Preloader() {
			super(root.loaderInfo.parameters.config || 'config.xml');
		}
		
		protected override function added(e:Event):void {
			super.added(e);
			_asset = new Asset(); 
			_asset.label.autoSize = "left";
			_asset.label.text = LOADING_LABEL;
			_asset.type.x = _asset.label.x + _asset.label.width + 20;
			_asset.bar.scaleX = 0;
			addChild(_asset as DisplayObject);
			addEventListener(Event.RESIZE, resize);
			_loader.onProgress.add(onProgress);
			_asset.type.text = "Config";
			resize(null);
		}
		
		private function resize(e:Event):void {
			_asset.x = stage.stageWidth * .5;
			_asset.y = stage.stageHeight * .5;
		}
		
		private function onProgress(signal:ProgressSignal):void {
			_asset.bar.scaleX = signal.progress * .01;
		}
		
		protected override function configLoaded(signal:LoaderSignal, child:ILoader):void {
			_asset.type.text = "Data";
			
			super.configLoaded(signal, child);
		}
		
		protected override function dataLoaded(signal:LoaderSignal, data:Dictionary):void {
			_asset.type.text = "Assets";
			super.dataLoaded(signal, data);
		}
		
		protected override function assetsLoaded(signal:LoaderSignal, data:Dictionary):void {
			_asset.type.text = "Initializing";
			removeEventListener(Event.RESIZE, resize);
			super.assetsLoaded(signal, data);
		}
		
	}
}