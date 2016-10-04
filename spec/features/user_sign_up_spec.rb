require 'rails_helper'

feature 'user sign up' do
  scenario 'successfully' do
    user = build(:user)

    visit root_path

    click_on 'Cadastrar'
    fill_in 'Nome', with: user.name
    fill_in 'Endereço', with: user.address
    fill_in 'CPF', with: user.cpf
    fill_in 'Email', with: user.email
    fill_in 'Telefone', with: user.phone
    fill_in 'Senha', with: user.password
    fill_in 'Confirme sua senha', with: user.password

    within('form') do
      click_on 'Cadastrar'
    end

    expect(page).to have_content 'Cadastro efetuado com sucesso!'
    expect(page).to have_content "Olá, #{user.name}"
    expect(current_path).to eq root_path
  end
  scenario 'cant sign up if miss some fields' do
    user = build(:user)

    visit root_path

    click_on 'Cadastrar'

    fill_in 'Nome', with: user.name
    fill_in 'CPF', with: user.cpf
    fill_in 'Telefone', with: user.phone


    within('form') do
      click_on 'Cadastrar'
    end

    expect(page).to have_content 'não pode ficar em branco'
  end
end
