class AddUnspentExperienceToInvestigators < ActiveRecord::Migration[5.1]
  def change
    add_column :investigators, :unspent_experience, :integer
  end
end
