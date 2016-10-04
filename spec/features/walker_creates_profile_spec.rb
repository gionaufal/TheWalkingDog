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

    within('form') do
      click_on 'Cadastrar'
    end

    expect(page).to have_content 'Você foi cadastrado com sucesso'
    expect(page).to have_content walker.name
  end
  scenario 'and dont fill in required fields' do

    visit root_path

    click_on 'Se cadastre como walker!'

    within('form') do
      click_on 'Cadastrar'
    end

    expect(page).to have_content 'não pode ficar em branco'
  end
end
