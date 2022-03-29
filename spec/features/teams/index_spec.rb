require 'rails_helper'

RSpec.describe 'teams index page' do
  before (:each) do
    @team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    @team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)
    @team_3 = Team.create!(name: 'Gym Tannehill Laundry', games_played: 9, winning_record: true)
    @team_4 = Team.create!(name: 'Red Solo Kupp', games_played: 10, winning_record: false)
  end

  it 'shows all teams' do
    visit '/teams'

    expect(page).to have_content(@team_1.name)
    expect(page).to have_content(@team_2.name)
    expect(page).to have_content(@team_3.name)
    expect(page).to have_content(@team_4.name)
    expect(page).not_to have_content("Dude Looks Like a Brady")
  end

  it 'shows all the teams in order of created_at, most recent first' do
    visit '/teams'

    expect(@team_4.name).to appear_before(@team_3.name)
    expect(@team_3.name).to appear_before(@team_2.name)
    expect(@team_2.name).to appear_before(@team_1.name)
    expect(@team_2.name).not_to appear_before(@team_4.name)
  end

  it 'each team has a link to edit their info' do
    # visit '/teams'
    #
    # within ".team-#{@team_4.id}" do
    #   expect(page).to have_link("Update")
    #   click_link("Update")
    #   expect(current_path).to eq("/teams/#{@team_4.id}/edit")
    # end
    #
    # visit '/teams'
    #
    # within ".team-#{@team_3.id}" do
    #   expect(page).to have_link("Update")
    #   click_link("Update")
    #   expect(current_path).to eq("/teams/#{@team_3.id}/edit")
    # end

    Team.all.each do |team|
      visit '/teams'
      within ".team-#{team.id}" do
        expect(page).to have_link("Update")
        click_link("Update")
        expect(current_path).to eq("/teams/#{team.id}/edit")
      end
    end
  end
end
