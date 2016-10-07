require 'rails_helper'

feature 'walker sees owner profile' do
  scenario 'successfully' do
    walker = create(:walker)
    user = create(:user)
    create(:dog, user: user)

    login_as(walker, scope: :walker)

    visit profile_path user
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.dogs.first.name)
    expect(page).to have_content(user.address)
  end

  scenario 'and cant see profile if is not logged' do
    user = create(:user)
    create(:dog, user: user)

    visit profile_path user
    expect(page).to have_content('Log in')
  end
end
