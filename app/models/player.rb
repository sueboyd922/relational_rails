class Player < ApplicationRecord
  belongs_to :team

  validates_presence_of :name
  validates_presence_of :position
  validates_presence_of :points
  validates_inclusion_of :active, :in => [true, false]
end
