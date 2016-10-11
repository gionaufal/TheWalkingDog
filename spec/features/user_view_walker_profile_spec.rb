require 'rails_helper'

feature 'user view walker profile' do
  scenario 'successfully' do
    walker = create(:walker, region: 'Centro')

    visit root_path

    select 'Centro', from: 'Onde você está?'

    click_on 'Procurar'

    within '.walkers' do
      click_on 'Saiba mais'
    end

    expect(page).to have_content walker.name
    expect(page).to have_content walker.age
    expect(page).to have_content walker.bio
    expect(page).to have_content walker.experience
    expect(page).to have_content walker.price
  end
  scenario 'and is empty' do
    visit root_path

    expect(page).to have_content 'Não temos nenhum walker cadastrado'
  end
end
