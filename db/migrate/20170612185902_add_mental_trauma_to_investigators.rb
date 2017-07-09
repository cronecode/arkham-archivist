class AddMentalTraumaToInvestigators < ActiveRecord::Migration[5.1]
  def change
    add_column :investigators, :mental_trauma, :integer
  end
end
