$(document).ready(function() {
  var inputFields = $('.file-field');

  inputFields.each(function(){
    var field = $(this);
    var input = field.find('input.file.optional');
    var label = field.find('span.file.optional');
    var buttonClasses = $('body').attr('data-path').indexOf('walker') > -1
      ? 'red' : ''
    var button = "<div class='button secondary " + buttonClasses + "'>"+ label.text()+"</div>";

    field.append(button);

    var addImageButton = field.find('.button');

    addImageButton.on('click', function(){
      input.trigger('click');
    })

    input.on('change', function() {
      var files = $(this).get(0).files;
      var image = files[0];

      addImageButton.text(image.name + " (clique para trocar de imagem)");
    });
  })
});
