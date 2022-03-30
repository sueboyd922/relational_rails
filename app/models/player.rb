class Player < ApplicationRecord
  belongs_to :team

  validates_presence_of :name
  validates_presence_of :position
  validates_presence_of :points
  validates_inclusion_of :active, :in => [true, false]

  def self.active_players
    where(active: true)
  end

  def self.alphabetize
    order(name: :asc)
  end

  def self.points_over(pts)
    # where(:points.to_s.to_i > pts)
    where("points > ?", pts)
  end

  def active?
    self.active ? "Active" : "Inactive"
  end
end
