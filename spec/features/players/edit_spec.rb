require 'rails_helper'

RSpec.describe 'edit players page' do
  before (:each) do
    @team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    @team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)
    @player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: @team_1.id)
    @player_2 = Player.create!(name: 'Derrick Henri', position: 'RB', points: 260, active: true, team_id: @team_1.id)
    @player_3 = Player.create!(name: 'Davante Adams', position: 'WR', points: 275, active: false, team_id: @team_2.id)
  end

  it 'is linked to edit a player from the player show page' do
    Player.all.each do |player|
      visit "/players/#{player.id}"
      click_link("Update")
      expect(current_path).to eq("/players/#{player.id}/edit")
    end
  end

  it 'can edit a player and display the new info' do
    visit "/players/#{@player_2.id}/edit"

    fill_in("Name", with: "Derrick Henry")
    fill_in("Points", with: 273)
    click_on("Save")

    expect(current_path).to eq("/players/#{@player_2.id}")
    expect(page).to have_content("Derrick Henry")
    expect(page).to have_content(273)
    expect(page).to have_content("RB")
    expect(page).not_to have_content(260)
    expect(page).not_to have_content("Derrick Henri")
  end
end
