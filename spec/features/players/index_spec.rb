require 'rails_helper'

RSpec.describe 'players index page', type: :feature do
  before (:each) do
    @team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    @player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: @team_1.id)
    @player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: @team_1.id)
    @player_3 = Player.create!(name: "Davante Adams", position: 'WR', points: 243, active: false, team_id: @team_1.id)
    @player_4 = Player.create!(name: "Travis Kelce", position: 'TE', points: 224, active: true, team_id: @team_1.id)
  end

  it 'shows all players who are active' do
    visit '/players'
    Player.active_players.each do |player|
      expect(page).to have_content(player.name)
      expect(page).to have_content(player.position)
      expect(page).to have_content(player.points)
      expect(page).to have_content(player.active?)
    end

    expect(page).not_to have_content(@player_3.name)
    expect(page).not_to have_content(@player_3.position)
    expect(page).not_to have_content(@player_3.points)
    expect(page).not_to have_content(@player_3.active?)
  end

  it 'each player has a link to edit their info' do
    Player.active_players.each do |player|
      visit '/players'
      within ".player-#{player.id}" do
        expect(page).to have_link("Edit")
        click_link("Edit")
        expect(current_path).to eq("/players/#{player.id}/edit")
      end
    end

    visit '/players'
    expect(page).not_to have_content(@player_3.name)
  end

  it 'has an option to delete each player' do
    Player.active_players.each do |player|
      delete_player = player.name
      visit '/players'
      within ".player-#{player.id}" do
        click_link("Delete")
        expect(current_path).to eq("/players")
      end
      expect(page).not_to have_content(delete_player)
    end
  end
end
