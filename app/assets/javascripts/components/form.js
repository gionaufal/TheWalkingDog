$(document).ready(function() {
  var forms = $('.simple_form');
  var passwords = $('input.password.required');

  forms.each(function() {
    var form = $(this);
    var inputs = form.find('input[type=text], input[type=email], input[type=tel], input[type=password], input[type=number], textarea');

    inputs.each(function() {
      var input = $(this);

      if (input.val().length > 0) {
        input.parent().addClass('has-content');
      }

      input.on('keyup', function() {
        var parent = input.parents('.input-field');
        if (input.val().length > 0) {
          parent.addClass('has-content');
        } else {
          parent.removeClass('has-content');
        }
      });
    });
  });

  passwords.each(function() {
    var password = $(this);
    var helpBlock = password.parent().find('.help-block');

    password.on('blur', function() {
      if (password.val().length < 6) {
        helpBlock.addClass('active').text('A senha deve ter no mínimo 6 caracteres');
      } else {
        helpBlock.removeClass('active');
      }
    })
  });
});
