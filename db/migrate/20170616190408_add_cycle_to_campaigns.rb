class AddCycleToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :cycle, :string
  end
end
