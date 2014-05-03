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

}); // closes ready
