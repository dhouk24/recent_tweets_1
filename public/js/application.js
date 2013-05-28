$(document).ready(function() {
  if($("div#load").length > 0) {
    var user = $('#user').text();
    $.get('/' + user + '/fetch', function(results){
        // var tweets = JSON.parse(results);
        // for (i=0; i<results.length; i++) {
        //   results[i].tweet.tweet
        // }
        var page = results;
        $('div#load').append(page);
        // grab some div, append / or replace results
    });
   
    }

  });

  //if !tweets_stale, then load as normal.  
  //else dispaly a wait message to the user.  
  // then load the page using an ajax request (require a new url)
  // new URL will return html (or a response) which contains the list of tweets to be rendered.
  // replace the "please wait" message with the list of tweets when it is ready
// });

// if i make it to loading # => if ($(div#load).length > 0)
// then make request to update tweets
// when that's done
// replace loading by tweets
