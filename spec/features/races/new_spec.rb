require 'rails_helper'

RSpec.describe 'Create New Race' do
  describe 'as a visitor' do
    before(:each) do
      @nathan = Runner.create!(name: 'Nathan', age: 32, country: 'USA')
      @kelly = Runner.create!(name: 'Kelly', age: 24, country: 'DRC')
      @camille = Runner.create!(name: 'Camille', age: 30, country: 'UK')
      @nicholas = Runner.create!(name: 'Nicholas', age: 26, country: 'CA')

      @leadville_100 = Race.create!(name: 'Leadville 100', location: 'Leadville, CO', length: 100)
      @turkey_trot = Race.create!(name: 'Thanksgiving Turkey Trot', location: 'Naples, FL', length: 3.2)

      @race_runner_1 = RaceRunner.create!(runner: @nathan, race: @leadville_100, runner_time: 72, runner_place: 56)
      @race_runner_2 = RaceRunner.create!(runner: @kelly, race: @leadville_100, runner_time: 85.5, runner_place: 178)
      @race_runner_3 = RaceRunner.create!(runner: @camille, race: @leadville_100, runner_time: 60, runner_place: 5)
      @race_runner_4 = RaceRunner.create!(runner: @nicholas, race: @leadville_100, runner_time: 135.3, runner_place: 398)

      @race_runner_5 = RaceRunner.create!(runner: @nathan, race: @turkey_trot, runner_time: 17.5, runner_place: 2)
      @race_runner_6 = RaceRunner.create!(runner: @kelly, race: @turkey_trot, runner_time: 17, runner_place: 1)
    end

    it "I can add a new race to the index" do
      visit races_path

      expect(page).to have_content(@leadville_100.name)
      expect(page).to have_content(@turkey_trot.name)

      expect(page).to have_button("Add A Race")
      click_button "Add A Race"
      expect(current_path).to eq(new_race_path)

      name = "Run For Your Life"
      location = "Denver, CO"
      length = "1"

      fill_in "Name", with: name
      fill_in "Location", with: location
      fill_in "Length", with: length

      click_button "Submit"
      expect(current_path).to eq(races_path)

      expect(page).to have_content(name)
      expect(page).to have_content(location)
      expect(page).to have_content(length)
    end
  end
end
