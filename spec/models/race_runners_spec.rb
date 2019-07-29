require 'rails_helper'

RSpec.describe RaceRunner do

  describe "relationships" do
    it {should belong_to :race}
    it {should belong_to :runner}
  end
end
