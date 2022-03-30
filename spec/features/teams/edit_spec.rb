require 'rails_helper'

RSpec.describe 'team edit page' do
  before (:each) do
    @team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
  end

  it 'brings you to an update form' do
    visit "/teams/#{@team_1.id}"
    click_on ("Edit")
    expect(current_path).to eq("/teams/#{@team_1.id}/edit")
  end

  it 'can update a team and display the change' do
    visit "/teams/#{@team_1.id}/edit"

    fill_in("Name", with: "Dakstreet's Back")
    select "true", from: :winning_record
    fill_in("Games played", with: 12)
    click_on("Edit")

    expect(current_path).to eq("/teams")
    expect(page).to have_content("Dakstreet's Back")
    expect(page).to have_no_content("Dakstreet Boys")
  end
end
