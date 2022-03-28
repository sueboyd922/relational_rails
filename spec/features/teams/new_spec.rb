require 'rails_helper'

RSpec.describe 'teams index page' do
  before (:each) do
    @team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    @team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)
    @team_3 = Team.create!(name: 'Gym Tannehill Laundry', games_played: 9, winning_record: true)
    @team_4 = Team.create!(name: 'Red Solo Kupp', games_played: 10, winning_record: false)
  end

  # it 'links to create a new team' do
  #   visit '/teams'
  #
  #   expect(page).to have_link("New Team")
  #   save_and_open_page
  #   click_link("New Team")
  #   expect(current_path).to eq("/teams/new")
  # end
end
