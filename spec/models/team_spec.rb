require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should have_many(:players) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :games_played }
    it { should allow_value(true).for :winning_record}
    it { should allow_value(false).for :winning_record}
    it { should_not allow_value(nil).for :winning_record}
  end

  describe 'methods' do
    it 'has a readable created_at date' do
      team = Team.create!(name: 'Dakstreet Boys', games_played: 10, winning_record: false)

      date = Time.now.utc
      expect(team.readable_date).to eq(date.strftime('%m/%d/%Y %H:%M %p'))
    end

    it 'can count how many players on each team' do
      team_1 = Team.create!(name: 'Dakstreet Boys', games_played: 9, winning_record: false)
      player_1 = Player.create!(name: 'Josh Allen', position: 'QB', points: 312, active: true, team_id: team_1.id)
      player_2 = Player.create!(name: 'Derrick Henry', position: 'RB', points: 260, active: true, team_id: team_1.id)

      expect(team_1.num_of_players).to eq 2
    end


  end
end
