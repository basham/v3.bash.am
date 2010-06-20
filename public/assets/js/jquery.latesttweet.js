(function( $ ){
	$.extend( {
		
		twitterURL: 'http://twitter.com/',
		
		enhanceTweet: function( data ) {
			
			if ( data == 'undefined' )
				return;
			
			$.each( data, function( i, status ) {
				//var t = 'http://twitter.com/'
				status.user.profile_url = $.twitterURL + status.user.screen_name;
				status.status_url = status.user.profile_url + '/status/' + status.id;
				status.time_ago = $.timeAgo('h');
				status.html = $.twitterize(status.text);
			});
			
			console.log(data);
			
			return data;
		},
		
		timeAgo: function( time ) {
			return 'woots';
		},
		
		twitterize: function( text ) {
		  	// Replace URLs with a link to the URL
		  	text = text.replace(/([a-zA-Z]+:\/\/[\w.\?\/\%\#=]+)/, '<a href="$1">$1</a>');
		  	// Replace a user reference to a link to the user's profile
		  	text = text.replace(/@([a-zA-Z0-9_]+)/, '@<a href="' + $.twitterURL + '$1">$1</a>');
		  	// Replace a hash tag reference to a search link
		  	text = text.replace(/#(\S+)/, '<a href="' + $.twitterURL + 'search?q=%23$1">#$1</a>');
			return text;
		}
		
	});
})( jQuery );

