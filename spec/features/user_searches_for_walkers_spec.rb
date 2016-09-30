require 'rails_helper'

feature 'User searches for region' do
  scenario 'and sees walkers of that region' do

    walkers_c = create_list(:walker, 3, region: 'Centro')
    walkers_n = create_list(:walker, 4, region: 'Norte')

    visit root_path

    select 'Centro', from: 'Onde você está?'

    click_on 'Procurar'

    expect(page).to have_css('.walker', 3)
    expect(page).not_to have_content 'Norte'
  end
end
