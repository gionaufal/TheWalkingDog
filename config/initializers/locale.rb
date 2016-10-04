# Where the I18n library should search for translation files
I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
I18n.config.enforce_available_locales = false
I18n.available_locales = ['pt-BR', 'en']
#  Set default locale to something other than :en
I18n.default_locale = :'pt-BR'
