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
