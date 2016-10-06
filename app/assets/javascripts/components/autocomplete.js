$(document).ready(function() {
  var autocompletes = $('.autocomplete');
  // var loadAutocomplete = ;
  autocompletes.each(function() {
    var autocomplete = $(this);
    var label = autocomplete.find('label').text();
    var items = jQuery.map(autocomplete.find('select > option'), function(item) {
      return {
        value: $(item).val(),
        text: $(item).text()
      }
    });
    var input = autocomplete.find('input[type=submit]');

    var button = '<div class="autocomplete__button button primary white">';
    button += '<input class="autocomplete__input" type="text" />';
    button += '</div>';

    var foundTemplate = function(array) {
      var list = '<div class="autocomplete__list">';
      array.map()
    };

    autocomplete.append(button);

    var activeButton = autocomplete.find('.autocomplete__button');
    var activeInput = activeButton.find('input');

    activeInput.on('keyup', function(e) {
      var found = [];
      var value = activeInput.val();
      function search(element) {
        return element.text.indexOf(value) === 0 ? element : undefined;
      }
      if (value.length > 0) {
        found.push(items.find(search));

      }
      console.log(found)
    });
  });
  console.log(autocompletes);
});
