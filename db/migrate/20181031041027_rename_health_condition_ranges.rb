class RenameHealthConditionRanges < ActiveRecord::Migration[5.2]
  def up
    rename_table :health_condition_ranges, :health_conditions
  end
  def down
    rename_table :health_conditions, :health_condition_ranges
  end
end
