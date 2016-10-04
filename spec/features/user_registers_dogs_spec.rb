require 'rails_helper'

feature 'user registers dogs' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user, scope: :user)

    visit root_path
    click_on 'Meu perfil'
    click_on 'Cadastrar Cachorro'

    fill_in 'Nome', with: 'Porpeta'
    fill_in 'Idade', with: 2
    fill_in 'Porte', with: 'Pequeno'
    fill_in 'Raça', with: 'Vira-lata'
    fill_in 'Personalidade', with: 'Sociável'
    attach_file('dog_avatar', "#{Rails.root}/spec/support/fixtures/Dogs-Bite.jpg")

    click_on 'Salvar'

    expect(page).to have_content('Seu cão foi adicionado ao seu perfil.')
    expect(page).to have_css("img[src*='Dogs-Bite.jpg']")
    expect(page).to have_content('Porpeta')
    expect(page).to have_content('2 anos')
    expect(page).to have_content('Pequeno')
    expect(page).to have_content('Vira-lata')
    expect(page).to have_content('Sociável')

  end
  scenario 'must fill all fields' do
    user = create(:user)
    login_as(user, scope: :user)

    visit root_path
    click_on 'Meu perfil'
    click_on 'Cadastrar Cachorro'

    fill_in 'Nome', with: 'Porpeta'

    click_on 'Salvar'

    expect(page).to have_content('não pode ficar em branco')
  end
end
