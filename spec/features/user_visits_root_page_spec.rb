require 'rails_helper'

feature 'User visits root page' do
  scenario 'and sees walkers' do
    20.times do |n|
      create(:walker, email: "walker#{n}@gmail.com")
    end

    visit root_path

    expect(page).to have_css('.walker', count: 20)
    expect(page).to have_content("Encontre pessoas especializadas para passear \
                                  com seu melhor amigo próximas a você")
  end
end
