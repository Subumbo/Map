package com.ogilvy.ihg.map.controller
{
	import com.ogilvy.ihg.map.controller.command.BackHomeCommand;
	import com.ogilvy.ihg.map.controller.command.CloseOverlayCommand;
	import com.ogilvy.ihg.map.controller.command.HotspotClickedCommand;
	import com.ogilvy.ihg.map.controller.command.LoadModuleCommand;
	import com.ogilvy.ihg.map.controller.command.LoadOverlayCommand;
	import com.ogilvy.ihg.map.controller.command.ShareCommand;
	import com.ogilvy.ihg.map.controller.command.StartupCommand;
	import com.ogilvy.ihg.map.controller.signal.BackHomeSignal;
	import com.ogilvy.ihg.map.controller.signal.CloseOverlaySignal;
	import com.ogilvy.ihg.map.controller.signal.HotspotClickedSignal;
	import com.ogilvy.ihg.map.controller.signal.LoadModuleSignal;
	import com.ogilvy.ihg.map.controller.signal.LoadOverlaySignal;
	import com.ogilvy.ihg.map.controller.signal.ShareSignal;
	import com.ogilvy.ihg.map.model.ConfigModel;
	import com.ogilvy.ihg.map.model.ScreenManager;
	import com.ogilvy.ihg.map.service.FacebookShareService;
	import com.ogilvy.ihg.map.service.ShareService;
	import com.ogilvy.ihg.map.view.backbutton.BackButton;
	import com.ogilvy.ihg.map.view.backbutton.BackButtonMediator;
	import com.ogilvy.ihg.map.view.hotspot.Hotspot;
	import com.ogilvy.ihg.map.view.hotspot.HotspotMediator;
	import com.ogilvy.ihg.map.view.module.Module;
	import com.ogilvy.ihg.map.view.overlay.Overlay;
	import com.ogilvy.ihg.map.view.overlay.OverlayMediator;
	import com.ogilvy.ihg.map.view.share.Share;
	import com.ogilvy.ihg.map.view.share.ShareMediator;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import org.assetloader.AssetLoader;
	import org.robotlegs.mvcs.SignalContext;
	
	/**
	 * App Robotlegs context. 
	 * @author pwolleb
	 * 
	 */	
	
	public class MicrositeContext extends SignalContext {
		
		private var _loader:AssetLoader;
		
		/**
		 * Asset loader instance with loaded assets and data needs to be passed into the constructor 
		 * @param loader
		 * @param contextView
		 * @param autoStartup
		 * 
		 */		
		public function MicrositeContext(loader:AssetLoader, contextView:DisplayObjectContainer=null, autoStartup:Boolean=true) {
			_loader = loader;
			super(contextView, autoStartup);
		}
		
		
		/**
		 * Injects global signals, services and models.
		 * Maps signals to commands and mediators to its views. 
		 */		
		public override function startup():void {
			super.startup();
			
			injector.mapValue(AssetLoader, _loader)
			injector.mapValue(ScreenManager, new ScreenManager(contextView));
			injector.mapSingleton(ShareService);
			injector.mapSingleton(FacebookShareService);
			injector.mapSingleton(ConfigModel);
			
			signalCommandMap.mapSignalClass(HotspotClickedSignal, HotspotClickedCommand);
			signalCommandMap.mapSignalClass(LoadModuleSignal, LoadModuleCommand);
			signalCommandMap.mapSignalClass(BackHomeSignal, BackHomeCommand);
			signalCommandMap.mapSignalClass(LoadOverlaySignal, LoadOverlayCommand);
			signalCommandMap.mapSignalClass(CloseOverlaySignal, CloseOverlayCommand);
			signalCommandMap.mapSignalClass(ShareSignal, ShareCommand);
		
			mediatorMap.mapView(Hotspot, HotspotMediator);
			mediatorMap.mapView(Overlay, OverlayMediator);
			mediatorMap.mapView(BackButton, BackButtonMediator);
			mediatorMap.mapView(Share, ShareMediator);
			
			commandMap.execute(StartupCommand);
		}
	}
}