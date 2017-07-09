class CreateScenarios < ActiveRecord::Migration[5.1]
  def change
    create_table :scenarios do |t|
      t.string :name
      t.boolean :complete
      t.integer :campaign_id

      t.timestamps
    end

    add_foreign_key :scenarios, :campaigns, name: :scenarios_campaign_id_fk, column: :campaign_id
  end
end
