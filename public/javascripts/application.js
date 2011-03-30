$(function() {
  // ajax submit the form.
  $('#colour-form').submit(function(event) {
    event.preventDefault();

    var url = $(this).attr('action');

    $.post(url, {code: $('#code').val(), lang: $('#lang').val(), css_type: $('#css-type').val()}, function(data) {
      $('#preview').html(data);
    });
  });
});
