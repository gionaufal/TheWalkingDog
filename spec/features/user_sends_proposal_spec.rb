require 'rails_helper'

feature 'User sends proposal to walker' do
  scenario 'successfully' do
    user = create(:user)
    walker = create(:walker)
    dog = create(:dog, user: user)

    login_as(user, scope: :user)

    visit walker_path walker

    click_on 'Enviar proposta'
    select 'Segunda-feira',           from: 'Dias'
    select 'Noite',                   from: 'Período'
    select dog.name,                  from: 'Nome do cão'
    select 'Individual',              from: 'Tipo de passeio'
    fill_in 'Localização',            with: 'Rua dos bobos, 0'
    fill_in 'Observações',            with: 'Resting creepy face'

    click_on 'Enviar'

    expect(page).to have_content 'Proposta enviada! Aguarde a resposta.'
  end

  scenario 'fails to fill all fields' do
    user = create(:user)
    walker = create(:walker)
    create(:dog, user: user)

    login_as(user, scope: :user)

    visit walker_path walker

    click_on 'Enviar proposta'

    fill_in 'Observações', with: 'Resting creepy face'

    click_on 'Enviar'

    expect(page).to have_content 'não pode ficar em branco'
  end
end
