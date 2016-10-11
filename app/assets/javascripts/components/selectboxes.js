$(document).ready(function() {
  var selectFields = $('.input-field.select');

  selectFields.each(function() {
    var field = $(this);
    var select = field.find('select');
    var label = field.find('label');

    var buttonClasses = $('body').attr('data-path').indexOf('walker') > -1
      ? 'red' : ''
    var selectButton = "<a class='button secondary " + buttonClasses  + "'>" + label.text().replace('* ', '') + "</a>";

    field.append(selectButton);

    var button = field.find('.button');

    label.css({
      display: 'none'
    });
    field.css({
      position: 'relative'
    });
    button.css({
      position: 'absolute',
      top: 0,
      left: 0
    });
    select.css({
      height: button.outerHeight() + 20,
      width: button.outerWidth() + 20,
      left: 0,
      bottom: 0,
      background: '#fff',
      opacity: '0.001',
      top: 0,
      position: 'absolute',
      zIndex: 10,
      display: 'inline-block',
      cursor: 'pointer'
    });

    select.on('change', function() {
      var value = $(this).val();
      button.text(value);
    });

    select.on('mouseenter', function() {
      button.addClass('hover');
    });

    select.on('mouseleave', function() {
      button.removeClass('hover');
    });
  });
});
