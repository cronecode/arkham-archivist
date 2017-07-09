class AddPhysicalTraumaToInvestigators < ActiveRecord::Migration[5.1]
  def change
    add_column :investigators, :physical_trauma, :integer
  end
end
