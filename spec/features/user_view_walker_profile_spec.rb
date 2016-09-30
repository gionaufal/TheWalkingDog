require 'rails_helper'

feature 'user view walker profile' do
  scenario 'successfully' do

    walker = create(:walker)

    visit root_path

    click_on walker.name

    expect(page).to have_content walker.name
    expect(page).to have_content walker.age
    expect(page).to have_content walker.bio
    expect(page).to have_content walker.experience
    expect(page).to have_content walker.price
  end
end
