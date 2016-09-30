require 'rails_helper'

feature 'User searches for region' do
  scenario 'and sees walkers of that region' do
    create_list(:walker, 3, region: 'Centro')
    create_list(:walker, 4, region: 'Norte')

    visit root_path

    select 'Centro', from: 'Onde você está?'

    click_on 'Procurar'

    expect(page).to have_css('.walker', count: 3)
    expect(page).not_to have_content 'Norte'
  end
end
