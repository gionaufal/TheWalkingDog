require 'rails_helper'

feature 'user create a profile' do
  scenario 'successfully' do

    visit new_user_path

    fill_in 'Nome', with: user.name
    fill_in 'Endereço', with: user.address
    fill_in 'CPF', with: user.document
    
  end
end
