class CreateMechanisms < ActiveRecord::Migration[7.0]
  def change
    create_table :mechanisms do |t|
      t.string :name

      t.timestamps
    end
  end
end
