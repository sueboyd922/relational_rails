require 'rails_helper'

RSpec.describe 'players show page' do
  it "shows specific team's data do" do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: team_1.id)
    player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: team_1.id)

    visit "/players/#{player_1.id}"

    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.position)
    expect(page).to have_content(player_1.active)
    expect(page).to have_content(player_1.points)

    expect(page).not_to have_content(player_2.name)
    expect(page).not_to have_content(player_2.position)
    expect(page).not_to have_content(player_2.points)
  end

  it 'can delete a player' do
    jas = Team.create!(name: "Josh Allen's Shorts", games_played: 10, winning_record: true)
    josh = Player.create!(name: "Josh Allen", position: "QB", points: 240, active: true, team_id: jas.id)
    davante = Player.create!(name: "Davante Adams", position: "WR", points: 140, active: true, team_id: jas.id)
    alvin = Player.create!(name: "Alvin Kamara", position: "RB", points: 138, active: true, team_id: jas.id)

    visit "/players/#{alvin.id}"

    click_link("Delete")
    expect(current_path).to eq("/players")

    expect(page).not_to have_content("Alvin Kamara")
    expect(page).to have_content("Josh Allen")
    expect(page).to have_content("Davante Adams")

    visit "/teams/#{jas.id}/players"

    expect(page).not_to have_content("Alvin Kamara")
    expect(page).to have_content("Josh Allen")
    expect(page).to have_content("Davante Adams")
  end
end
