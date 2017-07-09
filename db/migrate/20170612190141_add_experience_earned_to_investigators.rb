class AddExperienceEarnedToInvestigators < ActiveRecord::Migration[5.1]
  def change
    add_column :investigators, :experience_earned, :integer
  end
end
