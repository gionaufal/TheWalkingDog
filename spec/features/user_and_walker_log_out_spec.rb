require 'rails_helper'

feature 'User and walker logout' do
  scenario 'user logout successfully' do
    user = create(:user)
    login_as(user, scope: :user)

    visit root_path

    expect(page).to have_content 'Meu perfil'

    click_on 'logout'

    expect(current_path).to eq root_path
    expect(page).to have_content 'login como dono'
  end

  scenario 'walker logout successfully' do
    walker = create(:walker)
    login_as(walker, scope: :walker)

    visit root_path

    expect(page).to have_content 'Minhas propostas'

    click_on 'logout'

    expect(page).to have_content 'login como walker'
  end
end
