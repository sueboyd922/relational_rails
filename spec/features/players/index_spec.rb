require 'rails_helper'

RSpec.describe 'players index page', type: :feature do
  it 'shows all players who are active' do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: team_1.id)
    player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: team_1.id)
    player_3 = Player.create!(name: "Davante Adams", position: 'WR', points: 243, active: false, team_id: team_1.id)
    player_4 = Player.create!(name: "Travis Kelce", position: 'TE', points: 224, active: true, team_id: team_1.id)

    visit '/players'

    # Player.all do |player|
    #   expect(page).to have_content(player.name)
    #   expect(page).to have_content(player.position)
    #   expect(page).to have_content(player.points)
    #   expect(page).to have_content(player.active)
    # end

    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.position)
    expect(page).to have_content(player_1.points)
    expect(page).to have_content(player_1.active)
    expect(page).to have_content(player_2.name)
    expect(page).to have_content(player_2.position)
    expect(page).to have_content(player_2.points)
    expect(page).to have_content(player_2.active)
    expect(page).to have_content(player_4.name)
    expect(page).to have_content(player_4.position)
    expect(page).to have_content(player_4.points)
    expect(page).to have_content(player_4.active)
    expect(page).not_to have_content(player_3.name)
    expect(page).not_to have_content(player_3.position)
    expect(page).not_to have_content(player_3.points)
    expect(page).not_to have_content(player_3.active)
  end

  it 'each player has a link to edit their info' do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: team_1.id)
    player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: team_1.id)
    player_3 = Player.create!(name: "Davante Adams", position: 'WR', points: 243, active: false, team_id: team_1.id)
    player_4 = Player.create!(name: "Travis Kelce", position: 'TE', points: 224, active: true, team_id: team_1.id)

    Player.all.each do |player|
      visit '/players'
      within ".player-#{player.id}" do
        expect(page).to have_link("Update")
        click_link("Update")
        expect(current_path).to eq("/players/#{player.id}/edit")
      end
    end
  end

end
