/*
 * DC Flickr - jQuery Flickr
 * Copyright (c) 2011 Design Chemical
 * http://www.designchemical.com/blog/
 *
 * Dual licensed under the MIT and GPL licenses:
 * 	http://www.opensource.org/licenses/mit-license.php
 * 	http://www.gnu.org/licenses/gpl.html
 *
 */

(function($){

	$.fn.dcFlickr = function(options) {

		//set default options
		var defaults = {
			base: 'http://api.flickr.com/services/feeds/',
			api: 'photos_public.gne',
			limit: 20,
			q: {
				lang: 'en-us',
				format: 'json',
				jsoncallback: '?'
			},
			onLoad : function() {}
		};

		//call the default otions
		var options = $.extend(defaults, options);
		var url = defaults.base + defaults.api + '?';
		var qfirst = true;

		for(var key in defaults.q){
			if(!qfirst)
				url += '&';
			url += key + '=' + defaults.q[key];
			qfirst = false;
		}
		
		var $dcFlickr = this;

		return $dcFlickr.each(function(options){

			var htmlString = "";
			limit = defaults.limit;
		
			$.getJSON(url, function(data){
			
				// Cycle each flickr image
				$.each(data.items, function(i,item){
					if(i < limit){
						// var source = item.media.m.replace(/_m\.jpg$/, ".jpg");
						var sourceSquare = (item.media.m).replace("_m.jpg", "_s.jpg");
						htmlString += '<li class="frame"><a href="' + item.link + '" target="_blank">';
						htmlString += '<img src="' + sourceSquare + '" alt="" />';
						htmlString += '</a></li>';
					}
				});
			   
				// append html to object
				$dcFlickr.html(htmlString);
				
			}).success(function() {
				// onLoad callback;
				defaults.onLoad.call(this);
			});
		});
	};
})(jQuery);