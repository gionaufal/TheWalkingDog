$(document).ready(function() {
  var flashes = $('.alert, .error, .success');

  flashes.each(function() {
    var flash = $(this);

    setTimeout(function() {
      flash.addClass('fade-out');
    }, 3000);
  });
});

