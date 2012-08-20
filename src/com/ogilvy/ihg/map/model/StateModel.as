package com.ogilvy.ihg.map.model {
	import com.ogilvy.ihg.map.controller.signal.StateModelUpdatedSignal;

	public class StateModel {
		
		[Inject] public var updated:StateModelUpdatedSignal;
		
		private const _states:Array = [];
		private var _currentState:String;
		
		
		public function addState(state:String):void {
			_states.push(state);	
		}
		
		public function set currentState(val:String):void {
			if(_currentState == val) return;
			_currentState = val;
			updated.dispatch();
		}
		
		public function get currentState():String {
			return _currentState;	
		}
	}
}