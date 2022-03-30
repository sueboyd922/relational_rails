require 'rails_helper'

RSpec.describe 'team players page', type: :feature do
  before (:each) do
    @team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    @team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)
    @player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: @team_1.id)
    @player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: @team_1.id)
    @player_3 = Player.create!(name: 'Davante Adams', position: 'WR', points: 275, active: false, team_id: @team_2.id)
    @player_4 = Player.create!(name: "Ezekiel Elliot", position: 'QB', points: 209, active: true, team_id: @team_1.id)
    @player_5 = Player.create!(name: 'Lamar Jackson', position: 'QB', points: 268, active: true, team_id: @team_1.id)
  end

  it 'shows players of a specific team' do
    visit "/teams/#{@team_1.id}/players"

    @team_1.players.each do |player|
      expect(page).to have_content(player.name)
      expect(page).to have_content(player.position)
      expect(page).to have_content(player.points)
      expect(page).to have_content(player.active)
    end

    expect(page).not_to have_content(@team_2.name)
    @team_2.players.each do |player|
      expect(page).not_to have_content(player.name)
      expect(page).not_to have_content(player.position)
      expect(page).not_to have_content(player.points)
      expect(page).not_to have_content(player.active)
    end

    # expect(page).to have_content(@player_1.name)
    # expect(page).to have_content(@player_1.position)
    # expect(page).to have_content(@player_1.points)
    # expect(page).to have_content(@player_1.active)
    # expect(page).to have_content(@player_2.name)
    # expect(page).to have_content(@player_2.position)
    # expect(page).to have_content(@player_2.points)
    # expect(page).to have_content(@player_2.active)
    # expect(page).not_to have_content(@player_3.name)
    # expect(page).not_to have_content(@player_3.position)
    # expect(page).not_to have_content(@player_3.points)
    # expect(page).not_to have_content(@player_3.active)
  end

  it 'can organize teams players in alphabetical order' do
    visit "/teams/#{@team_1.id}/players"

    expect(@player_1.name).to appear_before(@player_2.name)
    expect(@player_2.name).to appear_before(@player_4.name)
    expect(@player_4.name).to appear_before(@player_5.name)

    click_on("Alphabetize!")
    expect(current_path).to eq("/teams/#{@team_1.id}/players")

    expect(@player_2.name).to appear_before(@player_4.name)
    expect(@player_4.name).to appear_before(@player_1.name)
    expect(@player_1.name).to appear_before(@player_5.name)
    expect(@player_1.name).not_to appear_before(@player_4.name)
  end

  it 'has links for each player to their edit page' do
      @team_1.players.each do |player|
      visit "/teams/#{@team_1.id}/players"
      within ".player-#{player.id}" do
        expect(page).to have_link("Edit")
        click_link("Edit")
        expect(current_path).to eq("/players/#{player.id}/edit")
      end
    end
  end

  it 'can return players with points over a certain threshold' do
    visit "/teams/#{@team_1.id}/players"
    fill_in("Points Over", with: 265)
    click_on("Search")

    expect(current_path).to eq("/teams/#{@team_1.id}/players")
    expect(page).to have_content(@player_1.name)
    expect(page).to have_content(@player_5.name)
    expect(page).not_to have_content(@player_2.name)
    expect(page).not_to have_content(@player_4.name)

    visit "/teams/#{@team_1.id}/players"
    fill_in("Points Over", with: 300)
    click_on("Search")
    expect(page).to have_content("Josh Allen")
    expect(page).not_to have_content("Lamar Jackson")
    expect(page).not_to have_content("Ezekiel Elliot")
    expect(page).not_to have_content("Derrick Henry")
  end
end
