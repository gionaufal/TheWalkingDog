require 'rails_helper'

feature 'walker sees owner profile' do
  scenario 'successfully' do
    user = create(:user)

    visit profile_path user

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.dogs.first.name)
    expect(page).to have_content(user.address)
  end
end
