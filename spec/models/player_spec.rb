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
end
