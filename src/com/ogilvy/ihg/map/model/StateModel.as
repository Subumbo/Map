package com.ogilvy.ihg.map.model {

	public class StateModel {
		
		private const _states:Array = [];
		private var _currentState:String;
		
		
		public function addState(state:String):void {
			_states.push(state);	
		}
		
		public function set currentState(val:String):void {
			if(_currentState == val) return;
			_currentState = val;
		}
		
		public function get currentState():String {
			return _currentState;	
		}
	}
}