require 'rails_helper'

RSpec.describe Race, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :location}
    it {should validate_presence_of :length}
  end
  describe "relationships" do
    it {should have_many :race_runners}
    it {should have_many(:runners).through(:race_runners)}
  end
end
