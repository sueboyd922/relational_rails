require 'rails_helper'

RSpec.describe 'players index page' do
  it 'shows all players' do
    player_1 = Player.create(name: 'Josh Allen', position: 'QB', points: 312, active: true)
    player_2 = Player.create(name: 'Derrick Henry', position: 'RB', points: 260, active: true)

    visit '/players'

    save_and_open_page

    expect(page).to have_content(player_1.name)
    expect(page).to have_content(player_1.position)
    expect(page).to have_content(player_1.points)
    expect(page).to have_content(player_1.active)
    expect(page).to have_content(player_2.name)
    expect(page).to have_content(player_2.position)
    expect(page).to have_content(player_2.points)
    expect(page).to have_content(player_2.active)
  end
end
