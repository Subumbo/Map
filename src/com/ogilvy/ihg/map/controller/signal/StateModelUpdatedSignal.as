package com.ogilvy.ihg.map.controller.signal {
	import org.osflash.signals.Signal;
	
	public class StateModelUpdatedSignal extends Signal {
		
		public function StateModelUpdatedSignal(...valueClasses) {
			super(valueClasses);
		}
	}
}