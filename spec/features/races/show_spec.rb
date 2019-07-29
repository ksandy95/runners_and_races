require 'rails_helper'

RSpec.describe 'Race Show Page' do
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

    it "When I vist a race show page I see race information and all runners who participated and their information" do
      visit races_path
      click_link 'Leadville 100'
      expect(current_path).to eq(race_path(@leadville_100))

      expect(page).to have_content(@leadville_100.name)
      expect(page).to have_content(@leadville_100.location)
      expect(page).to have_content(@leadville_100.length)

      expect(page).to have_content(@nathan.name)
      expect(page).to have_content(@kelly.name)
      expect(page).to have_content(@camille.name)
      expect(page).to have_content(@nicholas.name)

      expect(page).to have_content(@race_runner_1.runner_time)
      expect(page).to have_content(@race_runner_2.runner_time)
      expect(page).to have_content(@race_runner_3.runner_time)
      expect(page).to have_content(@race_runner_4.runner_time)

      expect(page).to have_content(@race_runner_1.runner_place)
      expect(page).to have_content(@race_runner_2.runner_place)
      expect(page).to have_content(@race_runner_3.runner_place)
      expect(page).to have_content(@race_runner_4.runner_place)

      expect(page).to have_link(@nathan.name)
      expect(page).to have_link(@kelly.name)
      expect(page).to have_link(@camille.name)
      expect(page).to have_link(@nicholas.name)
    end
  end
end
