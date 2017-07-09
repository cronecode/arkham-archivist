class AddStatusToInvestigators < ActiveRecord::Migration[5.1]
  def change
    add_column :investigators, :status, :integer
  end
end
