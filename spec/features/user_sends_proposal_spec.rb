require 'rails_helper'

feature 'User sends proposal to walker' do
  scenario 'successfully' do
    user = create(:user)
    walker = create(:walker)
    dog = create(:dog, user: user)

    login_as(user, scope: :user)

    visit walker_path walker

    click_on 'Enviar proposta'

    fill_in 'Horário',                with: '12:00'
    fill_in 'Data',                   with: '12/10/2016'
    select 'Nome do cão',             with: dog.name
    select 'Tipo de passeio',         with: 'Individual'
    fill_in 'Observações',            with: 'Resting creepy face'

    click_on 'Enviar'

    expect(page).to have_content 'Proposta enviada! Aguarde a resposta.'
  end
end
