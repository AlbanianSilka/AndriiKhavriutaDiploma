class CreateAutomobiles < ActiveRecord::Migration[7.0]
  def change
    create_table :automobiles do |t|
      t.string :name
      t.integer :price
      t.integer :horse_power

      t.timestamps
    end
  end
end
