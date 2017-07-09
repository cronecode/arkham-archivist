class AddNotesToScenarios < ActiveRecord::Migration[5.1]
  def change
    add_column :scenarios, :notes, :string
  end
end
