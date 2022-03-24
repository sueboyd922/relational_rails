require 'rails_helper'

RSpec.describe 'players index page', type: :feature do
  it 'shows all players' do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)
    player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: team_1.id)
    player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: team_1.id)

    visit '/players'

    save_and_open_page

    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.position)
    expect(page).to have_content(player_1.points)
    expect(page).to have_content(player_1.active)
    expect(page).to have_content(player_2.name)
    expect(page).to have_content(player_2.position)
    expect(page).to have_content(player_2.points)
    expect(page).to have_content(player_2.active)


  end
end
