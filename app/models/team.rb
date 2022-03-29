class Team < ApplicationRecord
  has_many :players, dependent: :delete_all

  validates_presence_of :name
  validates_presence_of :games_played
  validates_inclusion_of :winning_record, :in => [true, false]

  def self.ordered_by_create
    order(created_at: :desc)
  end

  def readable_date
    created_at.strftime('%m/%d/%Y %H:%M %p')
  end

  def num_of_players
    players.count
  end
end
