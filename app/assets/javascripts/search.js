$(function() {
  
  $(".chat-group-form__input").on("keyup", function(){
    var input = $(".chat-group-form__input").val();
    $.ajax({
      type: 'GET',
      url: ' /posts/search',
      data: { keyword : input},
      dataType:'json'
    })
    .done(function(){
      console.log('success')
    })
    .fail(function(){
      console.log('bad')

    });
  });
});