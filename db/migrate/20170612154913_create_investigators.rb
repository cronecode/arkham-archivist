class CreateInvestigators < ActiveRecord::Migration[5.1]
  def change
    create_table :investigators do |t|
      t.string :name
      t.integer :campaign_id

      t.timestamps
    end

    add_foreign_key :investigators, :campaigns, name: :investigators_campaign_id_fk, column: :campaign_id
  end
end
