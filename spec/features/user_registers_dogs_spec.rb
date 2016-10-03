require 'rails_helper'

feature 'user registers dogs' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user)

    visit root_path
    click_on 'Meu perfil'
    click on 'Cadastrar Cachorro'

    fill_in 'Nome', with: 'Porpeta'
    fill_in 'Idade', with: 2
    fill_in 'Porte', with: 'Pequeno'
    fill_in 'Raça', with: 'Vira-lata'
    fill_in 'Personalidade', with: 'Sociável'

    click_on 'Salvar'

    expect(page).to have_content('Seu cão foi adicionado ao seu perfil.')
  end
end
