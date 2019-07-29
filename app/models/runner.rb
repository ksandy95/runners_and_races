class Runner < ApplicationRecord
  validates_presence_of :name, :country, :age

  has_many :race_runners
  has_many :races, through: :race_runners
end
