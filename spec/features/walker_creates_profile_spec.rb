require 'rails_helper'

feature 'walker creates a profile' do
  scenario 'and access new walker path' do
    walker = build :walker

    visit root_path

    click_on 'Se cadastre como walker!'

    fill_in 'Nome', with: walker.name
    fill_in 'Idade', with: walker.age
    fill_in 'Endereço', with: walker.address
    fill_in 'CPF', with: walker.cpf
    fill_in 'Bio/Descrição', with: walker.bio
    fill_in 'Experiência Profissional', with: walker.experience
    fill_in 'Preço base', with: walker.price
    fill_in 'Email', with: walker.email
    fill_in 'Telefone', with: walker.phone
    fill_in 'Região', with: walker.region
    fill_in 'Senha', with: walker.password
    fill_in 'Confirmar senha', with: walker.password

    click_on 'Cadastrar'

    expect(page).to have_content 'Você foi cadastrado com sucesso'
    expect(page).to have_content walker.name
    expect(page).to have_content walker.age
    expect(page).to have_content walker.bio
    expect(page).to have_content walker.experience
    expect(page).to have_content walker.price
    expect(page).to have_content walker.region
  end
  scenario 'and dont fill in required fields' do

    visit root_path

    click_on 'Se cadastre como walker!'

    click_on 'Cadastrar'

    expect(page).to have_content 'Por favor preencher corretamente'
  end
end
