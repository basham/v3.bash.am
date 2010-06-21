(function( $ ){
	$.extend( {
		
		twitterURL: 'http://twitter.com/',
		
		twitterize: function( data ) {
			
			if ( data == 'undefined' )
				return;
			
			$.each( data, function( i, status ) {
				status.user.profile_url = $.twitterURL + status.user.screen_name;
				status.status_url = status.user.profile_url + '/status/' + status.id;
				status.time_ago = $.timeAgo( status.created_at );
				status.html = $.plainToHTML(status.text);
			});
			
			return data;
		},
		
		timeAgo: function( time, notUnix, tzOffset ) {
			
			notUnix = notUnix == undefined ? true : notUnix;
			var date = !notUnix ? new Date(time * 1000) : new Date((time || '').replace(/-/g,'/').replace(/[]/g,' '));

			if (tzOffset)
				date.setHours( date.getHours() + tzOffset );

			var	delta = (( (new Date()).getTime() - date.getTime() ) / 1000);
			var deltaMinutes = Math.floor( delta / 60 );

			if ( isNaN(deltaMinutes) || deltaMinutes < 0 )
				return;
			
			if ( Math.abs( deltaMinutes ) <= ( 168 * 60 ) ) // 1 week
				return $.durationInWords( deltaMinutes ) + ( deltaMinutes < 0 ? ' from now' : ' ago' );

			return 'on ' + $.dateFormat( date );
		},
		
		dateFormat: function( date, format ) {
			
			var month = [
				'Jan', 'Feb', 'Mar', 'Apr',
				'May', 'Jun', 'Jul', 'Aug',
				'Sep', 'Oct', 'Nov', 'Dec'];
			
			var h = date.getHours();
			var H = h % 12 == 0 ? 12 : h % 12;
			var am = h < 12;
			// Time in am/pm
			var t = H + ':' + date.getMinutes() + ' ' + (am ? "AM" : "PM");
			// Date in MMM DD
			var d = month[date.getMonth()] + ' ' + date.getDate();
			// Add YYYY if it's not that year
			if ( date.getFullYear() != (new Date()).getFullYear() )
				d += ', ' + date.getFullYear();
			
			return t + ' ' + d;
		},
		
		durationInWords: function( minutes ) {
			if ( minutes < 1 )
				return 'less than a minute';
			if ( minutes < 50 )
				return $.pluralize( minutes, 'minute' );
			if ( minutes < 90 )
				return 'about one hour';
			if ( minutes < 1080 )
				return Math.round( minutes / 60 ) + ' hours';
			if ( minutes < 1440 )
				return 'one day';
			if ( minutes < 2880 )
				return 'about one day';
			return Math.round( minutes / 1440 ) + ' days';
		},
		
		pluralize: function( value, singular, plural ) {
		    plural = ( plural == undefined ) ? singular + 's' : plural;
		    return ( value == 1 ) ? singular : plural;
		},
	
		plainToHTML: function( text ) {
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

