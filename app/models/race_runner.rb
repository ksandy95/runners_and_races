class RaceRunner < ApplicationRecord
  validates_presence_of :runner_time, :runner_place

  belongs_to :runner
  belongs_to :race
end
