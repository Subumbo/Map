package com.ogilvy.ihg.map.model {
	
	/**
	 * locale: ISO langage country code ( e.g.: en_gb )
	 * flashRoot: If the flash files are not on the domain root this relative directory needs to be passed via the config.xml
	 * loadedrURL: SWF loader URL		 
	 * @author pwolleb
	 * 
	 */	
	
	public class ConfigModel {
		public var locale:String;
		public var flashRoot:String;
		public var loaderURL:String;
	}
}