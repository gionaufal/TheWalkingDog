require 'rails_helper'

feature 'Walker accepts proposal' do
  scenario 'successfully' do
    walker = create(:walker)
    proposal = create(:proposal, walker: walker, status: 0)

    login_as(walker, scope: :walker)

    visit root_path

    click_on 'Minhas propostas'

    expect(page).to have_content proposal.user.name
    expect(page).to have_content proposal.dogs
    expect(page).to have_content proposal.days
    expect(page).to have_content proposal.location

    click_on 'Aceitar'

    expect(current_path).to eq(walker_proposals_path(walker))
    expect(page).to have_content "Compromisso marcado para #{proposal.days}"
    expect(page).to have_content 'Proposta aceita'
  end

  scenario 'refuse proposal' do
    walker = create(:walker)
    proposal = create(:proposal, walker: walker, status: 0)

    login_as(walker, scope: :walker)

    visit root_path

    click_on 'Minhas propostas'

    expect(page).to have_content proposal.user.name
    expect(page).to have_content proposal.dogs
    expect(page).to have_content proposal.days
    expect(page).to have_content proposal.location

    click_on 'Recusar'

    expect(current_path).to eq(walker_proposals_path(walker))
    expect(page).to have_content 'A proposta foi recusada'
    expect(page).to have_content 'Proposta recusada'

  end

  scenario 'sees all accepted and refused proposals' do
    walker = create(:walker)
    create_list(:proposal, 6, walker: walker)

    login_as(walker, scope: :walker)

    visit root_path

    click_on 'Minhas propostas'

    expect(page).to have_css('.proposal', count: 6)
  end

end
