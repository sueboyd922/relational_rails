require 'rails_helper'

RSpec.describe 'index links on each page' do
  before (:each) do
    @team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
    @team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)
    @player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: @team_1.id)
    @player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: @team_1.id)
    @player_3 = Player.create!(name: 'Davante Adams', position: 'WR', points: 275, active: false, team_id: @team_2.id)
  end
  it 'the teams index page has a link to the player\'s index page' do

    visit '/teams'
    expect(page).to have_link('Players Index')
    click_link('Players Index')

    expect(page).to have_content(@player_1.name)
    expect(page).to have_content(@player_2.name)
    expect(page).to have_content(@player_3.name)
  end

  it 'each teams show page has a link to the players index' do
    visit "/teams/#{@team_1.id}"
    expect(page).to have_link('Players Index')
    click_link('Players Index')

    expect(page).to have_content(@player_1.name)
    expect(page).to have_content(@player_2.name)
    expect(page).to have_content(@player_3.name)

    visit "/teams/#{@team_2.id}"
    expect(page).to have_link('Players Index')
    click_link('Players Index')

    expect(page).to have_content(@player_1.name)
    expect(page).to have_content(@player_2.name)
    expect(page).to have_content(@player_3.name)
  end

  it 'has a link to the players index in each teams show page' do
    visit "/teams/#{@team_1.id}/players"

    expect(page).to have_link('Players Index')
    click_link('Players Index')

    expect(page).to have_content(@player_1.name)
    expect(page).to have_content(@player_2.name)
    expect(page).to have_content(@player_3.name)

    visit "/teams/#{@team_2.id}/players"

    expect(page).to have_link('Players Index')
    click_link('Players Index')

    expect(page).to have_content(@player_1.name)
    expect(page).to have_content(@player_2.name)
    expect(page).to have_content(@player_3.name)
  end

  it 'the players index has a link to the players index' do
    visit '/players'

    expect(page).to have_link('Players Index')
    click_link('Players Index')

    expect(page).to have_content(@player_1.name)
    expect(page).to have_content(@player_2.name)
    expect(page).to have_content(@player_3.name)
  end

  it 'has a link to the players index in each players show page' do
    visit "/players/#{@player_2.id}"

    expect(page).to have_link('Players Index')
    click_link('Players Index')

    expect(page).to have_content(@player_1.name)
    expect(page).to have_content(@player_2.name)
    expect(page).to have_content(@player_3.name)
  end


end
