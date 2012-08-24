package com.ogilvy.ihg.map.model {
	import com.ogilvy.ihg.map.model.vo.ModuleVO;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	import com.ogilvy.ihg.map.view.backbutton.BackButton;
	import com.ogilvy.ihg.map.view.home.Home;
	import com.ogilvy.ihg.map.view.module.Module;
	import com.ogilvy.ihg.map.view.overlay.Overlay;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	public class ScreenManager {
		
		private var _view:DisplayObjectContainer;
		private var _home:Home;
		private var _back:BackButton;
		private var _currentModule:Module;
		private var _overlay:Overlay;
		
		public function ScreenManager(view:DisplayObjectContainer) {
			_view = view;
		}
		
		public function init(homeModule:Home, backButton:BackButton, overlay:Overlay):void {
			_home = homeModule;
			_back = backButton;
			_overlay = overlay;
			_view.addChild(_home);
		}
		
		public function showModule(model:ModuleVO):void {
			var module:Module = new Module();
			module.data = model;
			_view.addChild(module);
			_view.addChild(_back);
			module.show();
			_back.show();
			_currentModule = module;
		}
		
		public function showHome():void {
			_back.hide();
			_currentModule.hide();
			_currentModule.hidden.addOnce(onModuleHidden);
		}
		
		private function onModuleHidden():void {
			_view.removeChild(_back);
			_view.removeChild(_currentModule);
			_currentModule.destroy();
		}
		
		public function showOverlay(model:OverlayVO):void {
			_overlay.data = model;
			_view.addChild(_overlay);
			_overlay.show();
			resize(_view.stage.stageWidth, _view.stage.stageHeight);	
		}
		
		public function hideOverlay():void {
			
		}
		
		public function resize(width:Number, height:Number):void {
			_overlay.x = width * .5
			_overlay.y = height * .5
		}
		
	}
}