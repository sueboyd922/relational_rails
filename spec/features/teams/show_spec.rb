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

    expect(page).not_to have_content(team_2.name)
  end

  it 'shows number of players for each team' do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: team_1.id)
    player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: team_1.id)

    visit "/teams/#{team_1.id}"

    save_and_open_page

    expect(page).to have_content(team_1.num_of_players)
  end
end
