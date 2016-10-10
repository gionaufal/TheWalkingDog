require 'rails_helper'

feature 'Walker edits profile' do
  scenario 'successfully' do
    walker = create(:walker)

    login_as(walker, role: :walker)

    visit root_path

    click_on 'Meu perfil'

    expect(page).to have_content walker.name

    click_on 'Editar perfil'

    fill_in 'Bio/Descrição', with: 'Sou um ótimo walker'
    fill_in 'Experiência Profissional', with: 'Dog walker certificado'
    fill_in 'Senha atual', with: walker.password

    click_on 'Atualizar'

    click_on 'Meu perfil'

    expect(page).to have_content 'Sou um ótimo walker'
    expect(page).to have_content 'Dog walker certificado'
  end
end
