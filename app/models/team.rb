class Team < ApplicationRecord
  has_many :players

  validates_presence_of :name
  validates_presence_of :games_played
end
