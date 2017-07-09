class AddResolutionToScenarios < ActiveRecord::Migration[5.1]
  def change
    add_column :scenarios, :resolution, :integer
  end
end
