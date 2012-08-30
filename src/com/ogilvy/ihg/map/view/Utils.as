package com.ogilvy.ihg.map.view {
	import flash.display.FrameLabel;
	import flash.display.MovieClip;

	
	
	/**
	 * Utils class 
	 * @author pwolleb
	 * 
	 */
	public class Utils {
		
		/**
		 * Adds a callback to a frame labeld by the argument label
		 * @param mc
		 * @param label
		 * @param func
		 * 
		 */		
		public static function addLabelScript(mc:MovieClip, label:String, func:Function):void {
			var labels:Array = mc.currentLabels;
			var i:int = labels.length;
			while(--i > -1) {
				if(FrameLabel(labels[i]).name == label) {
					mc.addFrameScript(FrameLabel(labels[i]).frame - 1, func);
					return;
				}
			}
			throw new Error("Utils::addLabelScript: The label '" + label + "' does not exist in the MovieClip '" + mc.name + "'");
		}
		
		/**
		 * Removes all callbacks of a frame labeld by the argument label
		 * @param mc
		 * @param label
		 * 
		 */		
		public static function removeLabelScript(mc:MovieClip, label:String):void {
			var labels:Array = mc.currentLabels;
			var i:int = labels.length;
			while(--i > -1) {
				if(FrameLabel(labels[i]).name == label) {
					mc.addFrameScript(FrameLabel(labels[i]).frame - 1, null);
					return;
				}
			}
			throw new Error("Utils::removeLabelScript: The label '" + label + "' does not exist in the MovieClip '" + mc.name + "'");
		}
	}
}