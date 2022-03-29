require 'rails_helper'

RSpec.describe 'new player page' do
  before (:each) do
    @team = Team.create!(name: 'Gym Tannehill Laundry', games_played: 9, winning_record: true)
  end

  it 'is linked through the specific teams players page' do
    visit "/teams/#{@team.id}/players"

    click_link("Add New Player")
    expect(current_path).to eq("/teams/#{@team.id}/players/new")
  end

  it 'creates a new player for a specific team' do
    visit "/teams/#{@team.id}/players/new"

    fill_in("Name", with: "Gabe Davis")
    fill_in("Position", with: "WR")
    select("true", from: :active)
    fill_in("Points", with: 118)
    click_on("Draft Player")

    expect(current_path).to eq("/teams/#{@team.id}/players")
    expect(page).to have_content("Gabe Davis")
    expect(page).to have_content("WR")
    expect(page).to have_content(118)
  end
end
