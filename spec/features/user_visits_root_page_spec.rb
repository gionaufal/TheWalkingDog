require 'rails_helper'

feature 'User visits root page' do
  scenario 'and sees walkers' do
    walkers = create_list(:walker, 20)

    visit root_path

    expect(page).to have_css('.walker', 20)
    expect(page).to have_content("Encontre pessoas especializadas para passear \
                                  com seu melhor amigo próximas a você")
  end
end
