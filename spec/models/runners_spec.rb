require 'rails_helper'

RSpec.describe Runner, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :country}
    it {should validate_presence_of :age}
  end
  describe "relationships" do
    it {should have_many :race_runners}
    it {should have_many(:races).through(:race_runners)}
  end
end
