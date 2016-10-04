require 'rails_helper'

feature 'User searches for region' do
  scenario 'and sees walkers of that region' do
    3.times do |n|
      create(:walker, email: "walker#{n}@gmail.com", region: 'Centro')
    end

    4.times do |n|
      create(:walker, email: "another_walker#{n}@gmail.com", region: 'Norte')
    end

    visit root_path

    select 'Centro', from: 'Onde você está?'

    click_on 'Procurar'

    expect(page).to have_css('.walker', count: 3)
    expect(page).not_to have_content 'Norte'
  end
end
