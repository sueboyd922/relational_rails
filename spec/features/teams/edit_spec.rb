require 'rails_helper'

RSpec.describe 'team edit page' do
  it 'can update an existing team' do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: team_1.id)
    player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: team_1.id)

    visit '/teams'
    click_on "Update #{team_1.name}"
    expect(current_path).to eq("/teams/#{team_1.id}/edit")
    fill_in("Name", with: "Dakstreet's Back")
    select "true", from: :winning_record
    fill_in("Games Played", with: "12")
    click_on("Update")
    expect(current_path).to eq("/teams")
    expect(page).to have_content("Dakstreet's Back")
    expect(page).to not_have_content("Dakstreet Boys")
  end
end
