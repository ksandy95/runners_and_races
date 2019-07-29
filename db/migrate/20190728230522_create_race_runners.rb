class CreateRaceRunners < ActiveRecord::Migration[5.2]
  def change
    create_table :race_runners do |t|
      t.references :runner, foreign_key: true
      t.references :race, foreign_key: true
      t.float :runner_time
      t.integer :runner_place
    end
  end
end
