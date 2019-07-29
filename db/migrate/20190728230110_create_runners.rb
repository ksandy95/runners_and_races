class CreateRunners < ActiveRecord::Migration[5.2]
  def change
    create_table :runners do |t|
      t.string :name
      t.string :country
      t.integer :age

      t.timestamps
    end
  end
end
