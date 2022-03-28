require 'rails_helper'

RSpec.describe 'teams index page' do
  it 'can create a new team' do
    visit '/teams'

    click_link("New Team")
    expect(current_path).to eq("/teams/new")

    fill_in("Name", with: "No Punt Intended")
    # fill_in("Winning record", with: false)
    select "false", :from => :winning_record
    fill_in("Games played", with: 10)
    click_on("Create Team")
    # new_team = Team.last
    expect(current_path).to eq("/teams")
    # expect(page).to have_content(new_team.name)
    expect(page).to have_content("No Punt Intended")
  end
end
