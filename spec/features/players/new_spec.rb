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
end
