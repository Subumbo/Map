package com.ogilvy.ihg.map.view {
	import flash.display.FrameLabel;
	import flash.display.MovieClip;

	public class Utils {
		
		public static function addLabelScript(mc:MovieClip, label:String, func:Function):void {
			var labels:Array = mc.currentLabels;
			var i:int = labels.length;
			while(--i > -1) {
				if(FrameLabel(labels[i]).name == label) {
					mc.addFrameScript(FrameLabel(labels[i]).frame - 1, func);
					return;
				}
			}
			throw new Error("WARNING: The label '" + label + "' does not exist in the MovieClip '" + mc.name + "'");
		}
	}
}