require 'rails_helper'

feature 'log in' do
  scenario 'user log in successfully' do
    user = create(:user)

    visit root_path

    click_on 'login como dono'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Log in'

    expect(page).to have_content "Olá, #{user.name}"
  end

  scenario 'walker log in successfully' do
    walker = create(:walker)

    visit root_path

    click_on 'login como walker'

    fill_in 'Email', with: walker.email
    fill_in 'Senha', with: walker.password

    click_on 'Log in'

    expect(page).to have_content "Olá, #{walker.name}"
  end

  scenario 'user fails to log in' do
    user = create(:user)

    visit root_path

    click_on 'login como dono'

    fill_in 'Email', with: user.email

    click_on 'Log in'

    expect(page).to have_content 'Log in'
  end

  scenario 'walker fails to log in' do
    walker = create(:walker)

    visit root_path

    click_on 'login como walker'

    fill_in 'Senha', with: walker.password

    click_on 'Log in'

    expect(page).to have_content 'Log in'
  end
end
