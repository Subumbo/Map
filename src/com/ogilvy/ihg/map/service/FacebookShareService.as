package com.ogilvy.ihg.map.service {
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	
	/**
	 * Shares a piece of content on Facebook 
	 * @author pwolleb
	 * 
	 */	
	
	public class FacebookShareService { 
		private const END_POINT:String = 'http://www.facebook.com/sharer.php?'
		
		/**
		 *  
		 * @param shareURL The URL to share
		 * @param title The share title
		 * @param description The share descritpion
		 * @param imageURL The share thumbnail
		 * 
		 */		
		public function send(shareURL:String, title:String, description:String, imageURL:String=''):void {
			var url:String = END_POINT;
			var data:URLVariables = new URLVariables();
			data['p[url]'] = shareURL;
			data['p[title]'] = title;
			data['p[summary]'] = description;
			if(imageURL != '') data['p[images][0]'] = imageURL;
			navigateToURL(new URLRequest(url + 's=100&' + data.toString()));
		}
	}
	
	
}