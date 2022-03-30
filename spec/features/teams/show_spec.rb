require 'rails_helper'

RSpec.describe 'teams show page' do
  it 'shows specific team\'s data' do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)

    visit "/teams/#{team_1.id}"

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

    expect(page).to have_content(team_1.num_of_players)
  end

  it 'links to update the current team' do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: team_1.id)
    player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: team_1.id)

    visit "teams/#{team_1.id}"
    click_link("Edit")
    expect(current_path).to eq("/teams/#{team_1.id}/edit")
  end

  it 'links to delete the team' do
    jas = Team.create!(name: "Josh Allen's Shorts", games_played: 10, winning_record: true)
    diggs = Team.create!(name: "Can You Diggs It", games_played: 11, winning_record: true)
    josh = Player.create!(name: "Josh Allen", position: "QB", points: 240, active: true, team_id: jas.id)
    davante = Player.create!(name: "Davante Adams", position: "WR", points: 140, active: true, team_id: jas.id)
    alvin = Player.create!(name: "Alvin Kamara", position: "RB", points: 138, active: true, team_id: jas.id)
    herb = Player.create!(name: "Justin Herbert", position: "QB", points: 249, active: true, team_id: diggs.id)

    visit "/teams/#{jas.id}"

    click_link ("Delete")
    expect(current_path).to eq("/teams")

    expect(page).not_to have_content("Josh Allen's Shorts")
    expect(page).to have_content("Can You Diggs It")

    visit "/players"
    expect(page).not_to have_content("Davante Adams")
    expect(page).not_to have_content("Josh Allen")
    expect(page).not_to have_content("Alvin Kamara")
    expect(page).to have_content("Justin Herbert")
  end
end
