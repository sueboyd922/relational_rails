require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'relationships' do
    it { should belong_to :team }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :position }
    it { should validate_presence_of :points }
    it { should allow_value(true).for :active}
    it { should allow_value(false).for :active}
    it { should_not allow_value(nil).for :active}
  end

  describe 'class and instance methods' do
    it '.active_players' do
      team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
      player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: team_1.id)
      player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: team_1.id)
      player_3 = Player.create!(name: "Davante Adams", position: 'WR', points: 243, active: false, team_id: team_1.id)
      player_4 = Player.create!(name: "Travis Kelce", position: 'TE', points: 224, active: true, team_id: team_1.id)

      expect(Player.active_players).to eq([player_1, player_2, player_4])
    end

    it ".alphabetize" do
      team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
      team_2 = Team.create!(name: 'Can You Diggs It', games_played: 10, winning_record: true)
      player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: team_1.id)
      player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: team_1.id)
      player_3 = Player.create!(name: 'Davante Adams', position: 'WR', points: 275, active: false, team_id: team_1.id)
      player_4 = Player.create!(name: "Ezekiel Elliot", position: 'QB', points: 209, active: true, team_id: team_1.id)

      expect(Player.alphabetize).to eq([player_3, player_2, player_4, player_1])
    end
  end
end
