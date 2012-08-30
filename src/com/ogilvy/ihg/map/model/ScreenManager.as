package com.ogilvy.ihg.map.model {
	import com.greensock.TweenMax;
	import com.greensock.easing.FastEase;
	import com.greensock.easing.Quad;
	import com.greensock.plugins.BlurFilterPlugin;
	import com.greensock.plugins.ColorTransformPlugin;
	import com.greensock.plugins.GlowFilterPlugin;
	import com.greensock.plugins.TransformMatrixPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.ogilvy.ihg.map.debug.Debug;
	import com.ogilvy.ihg.map.model.vo.ModuleVO;
	import com.ogilvy.ihg.map.model.vo.OverlayVO;
	import com.ogilvy.ihg.map.view.backbutton.BackButton;
	import com.ogilvy.ihg.map.view.module.HomeModule;
	import com.ogilvy.ihg.map.view.module.Module;
	import com.ogilvy.ihg.map.view.overlay.Overlay;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	/**
	 * Manages the application view states
	 * @author pwolleb
	 * 
	 */	
	
	public class ScreenManager {
		
		private var _view:DisplayObjectContainer;
		private var _home:HomeModule;
		private var _back:BackButton;
		private var _currentModule:Module;
		private var _overlay:Overlay;
		private const _content:Sprite = new Sprite()
		
		/**
		 * 
		 * @param Robotlegs contextView.
		 * 
		 */		
		public function ScreenManager(view:DisplayObjectContainer) {
			_view = view;
			TweenPlugin.activate([TransformMatrixPlugin, ColorTransformPlugin, GlowFilterPlugin]);
			FastEase.activate([Quad]);
		}
		
		/**
		 * Intialises the manager and shows the intro animation defined in HomeModule.intro 
		 * @param homeModuleVO
		 * 
		 */		
		public function init(homeModuleVO:ModuleVO):void {
			_home = new HomeModule();
			_home.data = homeModuleVO;
			_back = new BackButton(Lib.getMovieClip('BackButtonView'));;
			_back.x = 30;
			_back.y = 40;
			_view.addChild(_content);
			_content.addChild(_home);
			//_view.addChild(Lib.getMovieClip('Frame'));
			_home.intro();
		}
		
		/**
		 * Creates and shows a module 
		 * @param model
		 * 
		 */		
		public function showModule(model:ModuleVO):void {
			var module:Module = new Module();
			module.data = model;
			_content.addChild(module);
			_content.addChild(_back);
			TweenMax.to(_home, .4, {transformMatrix:{x:model.owner.coords.x * -2.8, y:model.owner.coords.y * -2.8, scaleX:4, scaleY:4}});
			module.show();
			module.shown.addOnce(_home.hide);
			_back.show();
			_currentModule = module;
		}
		
		/**
		 *  Hides current module and destroys it.
		 */		
		public function hideModule():void {
			_back.hide();
			_currentModule.hide();
			TweenMax.to(_home, .4, {transformMatrix:{x:0, y:0, scaleX:1, scaleY:1}, onComplete:_home.show});
			_currentModule.hidden.addOnce(onModuleHidden);
		}
		
		private function onModuleHidden():void {
			_content.removeChild(_back);
			_content.removeChild(_currentModule);
			_currentModule.destroy();
			_currentModule = null;
		}
		
		/**
		 * Creates and shows an overlay. 
		 * @param model
		 * 
		 */		
		public function showOverlay(model:OverlayVO):void {
			_overlay = new Overlay();
			_overlay.data = model;
			_content.addChild(_overlay);
			_overlay.show();
			resize(_content.stage.stageWidth, _content.stage.stageHeight);	
		}
		
		/**
		 * Hides an overlay and destroys it. 
		 * 
		 */		
		public function hideOverlay():void {
			_overlay.hide();
			_overlay.hidden.addOnce(function():void {
				_content.removeChild(_overlay);
				_overlay.destroy();
				_overlay = null;
			});
		}	
		
		
		/**
		 * Resizes the the main application view. 
		 * @param width
		 * @param height
		 * 
		 */		
		public function resize(width:Number, height:Number):void {
			_overlay.x = width * .5
			_overlay.y = height * .5
		}
		
		public function showDebugPanel():void {
			var d:Debug = new Debug();
			_content.addChild(d);
		}
		
	}
}