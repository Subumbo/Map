package com.ogilvy.ihg.map.controller
{
	import com.ogilvy.ihg.map.controller.command.BackHomeCommand;
	import com.ogilvy.ihg.map.controller.command.HotspotClickedCommand;
	import com.ogilvy.ihg.map.controller.command.LoadOverlayCommand;
	import com.ogilvy.ihg.map.controller.command.LoadModuleCommand;
	import com.ogilvy.ihg.map.controller.command.StartupCommand;
	import com.ogilvy.ihg.map.controller.signal.BackHomeSignal;
	import com.ogilvy.ihg.map.controller.signal.HotspotClickedSignal;
	import com.ogilvy.ihg.map.controller.signal.LoadOverlaySignal;
	import com.ogilvy.ihg.map.controller.signal.LoadModuleSignal;
	import com.ogilvy.ihg.map.controller.signal.ModuleLoadedSignal;
	import com.ogilvy.ihg.map.model.ScreenManager;
	import com.ogilvy.ihg.map.model.StateModel;
	import com.ogilvy.ihg.map.view.backbutton.BackButton;
	import com.ogilvy.ihg.map.view.backbutton.BackButtonMediator;
	import com.ogilvy.ihg.map.view.home.Home;
	import com.ogilvy.ihg.map.view.home.HomeMediator;
	import com.ogilvy.ihg.map.view.hotspot.Hotspot;
	import com.ogilvy.ihg.map.view.hotspot.HotspotMediator;
	import com.ogilvy.ihg.map.view.module.Module;
	import com.ogilvy.ihg.map.view.module.ModuleMediator;
	import com.ogilvy.ihg.map.view.overlay.Overlay;
	import com.ogilvy.ihg.map.view.overlay.OverlayMediator;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import org.assetloader.AssetLoader;
	import org.robotlegs.mvcs.SignalContext;
	
	public class MicrositeContext extends SignalContext {
		
		private var _loader:AssetLoader;
		
		public function MicrositeContext(loader:AssetLoader, contextView:DisplayObjectContainer=null, autoStartup:Boolean=true) {
			_loader = loader;
			super(contextView, autoStartup);
		}
		
		public override function startup():void {
			super.startup();
			
			injector.mapValue(AssetLoader, _loader);
			injector.mapSingleton(StateModel);
			injector.mapValue(ScreenManager, new ScreenManager(contextView));
			
			signalCommandMap.mapSignalClass(HotspotClickedSignal, HotspotClickedCommand);
			signalCommandMap.mapSignalClass(LoadModuleSignal, LoadModuleCommand);
			signalCommandMap.mapSignalClass(ModuleLoadedSignal, LoadModuleCommand);
			signalCommandMap.mapSignalClass(BackHomeSignal, BackHomeCommand);
			signalCommandMap.mapSignalClass(LoadOverlaySignal, LoadOverlayCommand);
			
			mediatorMap.mapView(Home, HomeMediator);
			mediatorMap.mapView(Hotspot, HotspotMediator);
			mediatorMap.mapView(Module, ModuleMediator);
			mediatorMap.mapView(Overlay, OverlayMediator);
			mediatorMap.mapView(BackButton, BackButtonMediator);
			
			commandMap.execute(StartupCommand);
		}
	}
}