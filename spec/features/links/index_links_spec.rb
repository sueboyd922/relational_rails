require 'rails_helper'

RSpec.describe 'index links on each page' do
  before (:each) do
    @team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    @team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)
    @player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: @team_1.id)
    @player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: @team_1.id)
    @player_3 = Player.create!(name: 'Davante Adams', position: 'WR', points: 275, active: false, team_id: @team_2.id)

    @views = ["/teams", "/teams/#{@team_1.id}", "/teams/#{@team_2.id}", "/teams/#{@team_2.id}/players", "/teams/#{@team_1.id}/players", "/players", "/players/#{@player_1.id}", "/players/#{@player_2.id}", "/players/#{@player_3.id}"]
  end

  it 'has a link on each team show page to go to the teams specific players page' do
    visit "/teams/#{@team_1.id}"

    expect(page).to have_link("#{@team_1.name}'s Players")
    click_link("#{@team_1.name}'s Players")
    expect(current_path).to eq("/teams/#{@team_1.id}/players")

    expect(page).to have_content(@player_1.name)
    expect(page).to have_content(@player_1.position)
    expect(page).to have_content(@player_2.name)
    expect(page).to have_content(@player_2.position)
    expect(page).not_to have_content(@player_3.name)
    expect(page).not_to have_content(@player_3.position)
  end

  it 'each page has a link to players index' do
    @views.each do |view|
      visit view

      expect(page).to have_link('All Players')
      click_link('All Players')
      expect(current_path).to eq("/players")

      expect(page).to have_content(@player_1.name)
      expect(page).to have_content(@player_2.name)
      expect(page).not_to have_content(@team_1.name)
    end
  end

  it 'each page has a link to team index' do
    @views.each do |view|
      visit view

      expect(page).to have_link('All Teams')
      click_link('All Teams')
      expect(current_path).to eq("/teams")

      expect(page).to have_content(@team_1.name)
      expect(page).to have_content(@team_2.name)
      expect(page).not_to have_content(@player_3.name)
    end
  end

  it 'has links in the players index to players show page' do
    Player.active_players.each do |player|
      visit "/players"
      within ".player-#{player.id}" do
        click_on("Show")
        expect(current_path).to eq("/players/#{player.id}")
      end
      expect(page).to have_content(player.name)
    end
  end

  it 'has links in the teams index to teams show page' do
    Team.all.each do |team|
      visit "/teams"
      within ".team-#{team.id}" do
        click_on("Show")
        expect(current_path).to eq("/teams/#{team.id}")
      end
      expect(page).to have_content(team.name)
    end
  end
end
