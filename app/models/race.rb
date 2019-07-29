class Race < ApplicationRecord
  validates_presence_of :name, :location, :length

  has_many :race_runners
  has_many :runners, through: :race_runners
end
