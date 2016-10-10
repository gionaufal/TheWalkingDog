$(document).ready(function() {
  var autocompletes = $('.autocomplete');

  autocompletes.each(function() {
    var autocomplete = $(this);
    var label = autocomplete.find('label').text();
    var items = jQuery.map(autocomplete.find('select > option'), function(item) {
      return {
        value: $(item).val(),
        text: $(item).text()
      }
    });
    var select = autocomplete.find('select');
    var input = autocomplete.find('input[type=submit]');

    var button = autocomplete.attr('data-context') === 'secondary'
      ? '<div class="autocomplete__button button secondary red">'
      : '<div class="autocomplete__button button primary white">';
    button += '<input class="autocomplete__input" type="text" value="' + label + '" />';
    button += '</div>';

    var foundTemplate = function(array) {
      var list = '<ul class="autocomplete__list">';
      array.map(function(item) {
        list += '<li class="item">' + item + '</li>';
      });
      list += '</ul>';
      return list;
    };

    autocomplete.append(button);

    var activeButton = autocomplete.find('.autocomplete__button');
    var activeInput = activeButton.find('input');

    function addItem (list, item) {
      if (list.indexOf(item) === -1) {
        list.push(item);
      }
    };

    let timeout;

    function hide(element) {
      $(element).addClass('hidden');
    };

    function show(element) {
      $(element).removeClass('hidden');
    };

    activeInput.on('keyup', function(e) {
      var found = [];
      var value = activeInput.val();
      clearTimeout(timeout);
      activeButton.find('.autocomplete__list').remove();
      function search(element) {
        return element.text.toLowerCase().indexOf(value.toLowerCase()) === 0 ? element : undefined;
      }
      if (value.length > 0 && items.find(search)) {
        addItem(found, items.find(search).text)
        activeButton.append(foundTemplate(found));
      } else {
        found.push('região não encontrada');
        activeButton.append(foundTemplate(found));
      }
      timeout = setTimeout(function() {
        activeButton.find('.autocomplete__list').remove();
      }, 1000);
    });

    activeInput.on('click', function() {
      $(this).val('');
    });

    activeButton.on('click', '.item', function(item) {
      var text = $(item.currentTarget).text();

      if (text) {
        activeInput.val(text);
        activeButton.find('.autocomplete__list').remove();
        select.val(text);
        setTimeout(function() {
          input.trigger('click');
        }, 300);
      }
    });

    // $('body').on('click', function(target) {
    //   if ($(target.currentTarget).hasClass('.overlay')) {
    //     activeInput.val(label);
    //   }
    // });
  });
});
