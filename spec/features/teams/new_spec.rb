require 'rails_helper'

RSpec.describe 'teams index page' do
  it 'can create a new team' do
    visit "/teams/new"

    fill_in("Name", with: "No Punt Intended")
    fill_in("Winning record", with: false)
    fill_in("Games played", with: 10)
    click_button("Create Team")
    new_team = Team.last
    expect(current_path).to eq("/teams")
    expect(page).to have_content(new_team.name)
  end


end
