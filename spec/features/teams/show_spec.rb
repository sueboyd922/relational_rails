require 'rails_helper'

RSpec.describe 'teams show page' do
  it 'shows specific team\'s data' do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)

    visit "/teams/#{team_1.id}"

    save_and_open_page
    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_1.games_played)
    expect(page).to have_content(team_1.winning_record)
  end
end
