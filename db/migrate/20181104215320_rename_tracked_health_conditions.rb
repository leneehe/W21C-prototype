class RenameTrackedHealthConditions < ActiveRecord::Migration[5.2]
  def change
    add_column :health_conditions, :unit_of_measure, :string 
  end
end
