package com.ogilvy.ihg.map.model {
	import com.greensock.TweenMax;
	import com.greensock.easing.FastEase;
	import com.greensock.easing.Quad;
	import com.greensock.plugins.BlurFilterPlugin;
	import com.greensock.plugins.TransformMatrixPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.ogilvy.ihg.map.model.vo.ModuleVO;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	import com.ogilvy.ihg.map.view.backbutton.BackButton;
	import com.ogilvy.ihg.map.view.module.HomeModule;
	import com.ogilvy.ihg.map.view.module.Module;
	import com.ogilvy.ihg.map.view.overlay.Overlay;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	public class ScreenManager {
		
		private var _view:DisplayObjectContainer;
		private var _home:Module;
		private var _back:BackButton;
		private var _currentModule:Module;
		private var _overlay:Overlay;
		
		public function ScreenManager(view:DisplayObjectContainer) {
			_view = view;
			TweenPlugin.activate([TransformMatrixPlugin]);
			FastEase.activate([Quad]);
		}
		
		public function init(homeModuleVO:ModuleVO):void {
			_home = new HomeModule();
			_home.data = homeModuleVO;
			_back = new BackButton(Lib.getMovieClip('BackButtonView'));;
			_view.addChild(_home);
			_home.show();
			var i:int = _view.numChildren;
		}
		
		public function showModule(model:ModuleVO):void {
			var module:Module = new Module();
			module.data = model;
			_view.addChild(module);
			_view.addChild(_back);
			TweenMax.to(_home, .4, {transformMatrix:{x:model.owner.coords.x * -2.8, y:model.owner.coords.y * -2.8, scaleX:4, scaleY:4}});
			module.show();
			_back.show();
			_currentModule = module;
		}
		
		public function showHome():void {
			_back.hide();
			_currentModule.hide();
			TweenMax.to(_home, .4, {transformMatrix:{x:0, y:0, scaleX:1, scaleY:1}});
			_currentModule.hidden.addOnce(onModuleHidden);
		}
		
		private function onModuleHidden():void {
			_view.removeChild(_back);
			_view.removeChild(_currentModule);
			_currentModule.destroy();
			_currentModule = null;
		}
		
		public function showOverlay(model:OverlayVO):void {
			_overlay = new Overlay();
			_overlay.data = model;
			_view.addChild(_overlay);
			_overlay.show();
			resize(_view.stage.stageWidth, _view.stage.stageHeight);	
		}
		
		public function hideOverlay():void {
			_overlay.hide();
			_overlay.hidden.addOnce(function():void {
				_view.removeChild(_overlay);
				_overlay.destroy();
				_overlay = null;
			});
		}	
		
		public function resize(width:Number, height:Number):void {
			_overlay.x = width * .5
			_overlay.y = height * .5
		}
		
	}
}