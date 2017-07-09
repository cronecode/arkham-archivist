class AddOrderToScenarios < ActiveRecord::Migration[5.1]
  def change
    add_column :scenarios, :order, :integer
  end
end
