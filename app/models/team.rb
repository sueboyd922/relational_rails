class Team < ApplicationRecord
  has_many :players

  validates_presence_of :name
  validates_presence_of :games_played
  validates_inclusion_of :winning_record, :in => [true, false]

  def readable_date
    created_at.strftime('%m/%d/%Y %H:%M %p')
  end

  def num_of_players
    self.players.count
  end
end
