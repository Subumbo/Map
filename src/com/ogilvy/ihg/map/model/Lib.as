package com.ogilvy.ihg.map.model
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	
	/**
	 * Lib pulls out Library Items from the asset/skin swfs
	 * @author pwolleb
	 * 
	 */	
	public class Lib
	{
		/**
		 *  
		 * @param name Export name of the libray item. Base class has to be MovieClip.
		 * @return 
		 * 
		 */		
		public static function getMovieClip(name:String):MovieClip {
			var Item : Class = ApplicationDomain.currentDomain.getDefinition(name) as Class;
			return new Item() as MovieClip;
		}
		
		/**
		 * 
		 * @param name Export name of the libray item. Base class has to be Sprite.
		 * @return 
		 * 
		 */		
		public static function getSprite(name:String):Sprite {
			var Item : Class = ApplicationDomain.currentDomain.getDefinition(name) as Class;
			return new Item() as Sprite;
		}
	}
}