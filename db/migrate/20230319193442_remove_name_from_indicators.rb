class RemoveNameFromIndicators < ActiveRecord::Migration[7.0]
  def change
    remove_column :indicators, :name, :string
  end
end
