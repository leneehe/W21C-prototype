class CreateHealthConditionRanges < ActiveRecord::Migration[5.2]
  def change
    create_table :health_condition_ranges do |t|
      t.string :condition_name
      t.float :normal_range_upper
      t.float :normal_range_lower

      t.timestamps
    end
  end
end
