require 'rails_helper'

RSpec.describe 'teams index page' do
  it 'shows all teams' do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)
    visit '/teams'

    save_and_open_page

    expect(page).to have_content(team_1.name)
    expect(page).to have_content(team_2.name)
  end
end
