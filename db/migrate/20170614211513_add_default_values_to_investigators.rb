class AddDefaultValuesToInvestigators < ActiveRecord::Migration[5.1]
  def change
    change_column_default :investigators, :status, from: nil, to: "ACTIVE"
    change_column_default :investigators, :physical_trauma, from: nil, to: 0
    change_column_default :investigators, :mental_trauma, from: nil, to: 0
    change_column_default :investigators, :experience_earned, from: nil, to: 0
    change_column_default :investigators, :unspent_experience, from: nil, to: 0
  end
end
