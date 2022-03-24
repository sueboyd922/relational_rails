require 'rails_helper'

RSpec.describe 'players show page' do
  it 'shows specific team\'s data do' do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: team_1.id)
    player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: team_1.id)

    visit "/players/#{player_1.id}"

    save_and_open_page

    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.position)
    expect(page).to have_content(player_1.active)
    expect(page).to have_content(player_1.points)
  end
end
