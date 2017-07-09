class AddVictoryDisplayToScenarios < ActiveRecord::Migration[5.1]
  def change
    add_column :scenarios, :victory_display, :integer
  end
end
