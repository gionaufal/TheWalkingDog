require 'rails_helper'

feature 'User rate walker' do
  scenario 'successfully' do
    user = create(:user)
    walker = create(:walker)
    proposal = create(:proposal, status: 1, walker: walker, user: user)
    login_as(user, scope: :user)

    visit root_path

    click_on 'Meu perfil'

    expect(page).to have_content 'Minhas propostas'
    expect(page).to have_content proposal.dogs
    expect(page).to have_content 'Avalie o walker!'

    choose '5'

    click_on 'Enviar nota'

    expect(current_path).to eq(my_profile_path)
    expect(page).to have_content 'Nota: 5'
  end
end
