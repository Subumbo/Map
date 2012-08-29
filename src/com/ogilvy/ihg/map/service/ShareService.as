package com.ogilvy.ihg.map.service {
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	
	public class ShareService {
		
		private const ADD_THIS_EXCHANGE_ENDPOINT:String = 'http://api.addthis.com/oexchange/0.8/';
		
		public function send(url:String, title:String, description:String):void {
			var shareURL:String;
			var data:URLVariables = new URLVariables();
			data.url = url;
			data.width = 500;
			data.height = 500;
			data.title = title;
			data.description = description;
			shareURL = ADD_THIS_EXCHANGE_ENDPOINT + 'offer?' + data.toString();
			
			if(ExternalInterface.available) 
				ExternalInterface.call('window.open', shareURL, '_blank');
			else 
				navigateToURL(new URLRequest(shareURL), '_blank');
		}
		
		
	}
}