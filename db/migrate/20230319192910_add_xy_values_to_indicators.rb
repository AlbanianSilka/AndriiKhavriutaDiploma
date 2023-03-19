class AddXyValuesToIndicators < ActiveRecord::Migration[7.0]
  def change
    add_column :indicators, :x_value, :integer
    add_column :indicators, :y_value, :integer
  end
end
