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
end
