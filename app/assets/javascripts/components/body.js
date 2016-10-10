$(document).ready(function() {
  var body = $('body');
  var windowHeight = function() {
    return window.outerHeight;
  };

  body.css('min-height', windowHeight());
  $(window).on('resize', function() {
    body.css('min-height', windowHeight());
  })
});
