require 'rails_helper'

feature 'user search for pet walker by region' do
  scenario 'successfully' do
    walker = create_list(:walker, 6, region: 'Centro')
    walker1 = create(:walker, region: 'Oeste')

    visit walkers_path

    fill_in 'Região', with: walker.region
    click_on 'Filtrar walkers'

    expect(page).to have_content walker.region

    expect(page).to have_no_content walker1.region

  end
end
