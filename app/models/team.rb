class Team < ApplicationRecord
  has_many :players

  validates_presence_of :name
  validates_presence_of :games_played
  validates_inclusion_of :winning_record, :in => [true, false]
end
