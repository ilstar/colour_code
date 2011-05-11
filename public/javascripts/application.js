$(function() {
  // ajax submit the form.
  $('#colour-form').submit(function(event) {
    event.preventDefault();

    var url = $(this).attr('action');

    $.post(url, $(this).serialize(), function(data) {
      $('#preview').html(data);
    });
  });

  // for ajax spinner
  $('body').ajaxStart(function() {
    $('#spinner').show();
  });
  $('body').ajaxStop(function() {
    $('#spinner').hide();
  });
});
