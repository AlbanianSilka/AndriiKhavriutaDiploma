class CreateIndicators < ActiveRecord::Migration[7.0]
  def change
    create_table :indicators do |t|
      t.string :name
      t.text :values
      t.references :mechanism, null: false, foreign_key: true

      t.timestamps
    end
  end
end
