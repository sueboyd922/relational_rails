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

  it 'shows all the teams in order of created_at, most recent first' do
    team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)
    team_3 = Team.create!(name: 'Gym Tannehill Laundry', games_played: 9, winning_record: true)
    team_4 = Team.create!(name: 'Red Solo Kupp', games_played: 10, winning_record: false)

    visit '/teams'

    save_and_open_page

    expect(team_4.name).to appear_before(team_3.name)
    expect(team_3.name).to appear_before(team_2.name)
    expect(team_2.name).to appear_before(team_1.name)
    exepect(team_4.created_at).to appear_before(team_3.created_at)
    exepect(team_3.created_at).to appear_before(team_2.created_at)
    expect(team_2.created_at).to appear_before(team_1.created_at)
  end
end
