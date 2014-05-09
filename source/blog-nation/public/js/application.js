$(document).ready(function() {

  $('#create-account').on('click', function(event) {
    event.preventDefault()
    console.log('working?')
    $('#create-account').hide()

    $.get('/users/create_account', function(form){
      $('.container').append(form);
    }).fail(function() {
      $('#create-account').show();
    }); // closes fail
  }); // closes get



// Need to fix wildcard get call below
    // $('#new-comment').on('click', function(event) {
    // event.preventDefault()
    // console.log('working?')
    // $('#new-comment').hide()

    // $.get('/posts/:id/comments/new', function(form){
    //   $('.container').append(form);
    // }).fail(function() {
    //   $('#new-comment').show();
    // }); // closes fail
  // }); // closes get

var current_h = null;
var current_w = null;

$('.resize').hover(
    function(){
        current_h = $(this, 'img')[0].height;
        current_w = $(this, 'img')[0].width;
        $(this).animate({width: (current_w * 2), height: (current_h * 2)}, 300);
    },
    function(){
        $(this).animate({width: current_w + 'px', height: current_h + 'px'}, 300);
    }
);

}); // closes ready


// test espn code below

$(document).ready(function(){
        var news_limit = 10;
        var news_offset = 0;

        $('a#load_more').click(function(){
            load_more_news();
        });

        function load_more_news(){
            news_offset += news_limit;
            $.ajax({ 
                url: "http://api.espn.com/v1/sports/football/nfl/news/headlines", 
                data: { 
                    // enter your developer api key here 
                    apikey: "94xfywwxecwhbvahb5pqdbb2",
                    // the type of data you're expecting back from the api 
                    _accept: "application/json",
                    // number of results to be shown
                    limit: news_limit,
                    offset: news_offset
                }, 
                dataType: "jsonp", 
                beforeSend: function(){
                    $('#result').html('Loading...');
                },
                success: function(data) { 
                    $('#result').html('');
                    // create an unordered list of headlines 
                    var ul = $('ul#list'); 
                    $.each(data.headlines, function() { 
                     var htm = this.headline;
                     htm += '<a class="readmore" href="'+this.links.web.href+'" target="_blank">Read more</a>';
                        var li = $('<li/>').html(htm); 
                        ul.append(li) 
                    }); 
                }, 
                error: function() { 
                     // handle the error 
                } 
            });
        }
        load_more_news();

// $('a#load_more1').click(function(){
//             load_more_news();
//         });

//         function load_more_news(){
//             news_offset += news_limit;
//             $.ajax({ 
//                 url: "http://api.espn.com/v1/sports/football/nfl/teams/8", 
//                 data: { 
//                     // enter your developer api key here 
//                     apikey: "94xfywwxecwhbvahb5pqdbb2",
//                     // the type of data you're expecting back from the api 
//                     _accept: "application/json",
//                     // number of results to be shown
//                     limit: news_limit,
//                     offset: news_offset
//                 }, 
//                 dataType: "jsonp", 
//                 beforeSend: function(){
//                     $('#result1').html('Loading...');
                    
//                 },
//                 success: function(data) { 
//                     $('#result1').html('');
//                     // create an unordered list of headlines 
//                     console.log(data)
//                     var ul = $('ul#list1'); 
//                     $.each(data.headlines, function() { 
//                      var htm = this.headline;
//                      htm += '<a class="readmore" href="'+this.links.web.href+'" target="_blank">Read more</a>';
//                         var li = $('<li/>').html(htm); 
//                         ul.append(li) 
//                     }); 
//                 }, 
//                 error: function() { 
//                      // handle the error 
//                 } 
//             });
//         }
//         load_more_news();
    });


