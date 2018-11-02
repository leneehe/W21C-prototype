class AddHealthConditionReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :tracked_health_conditions, :health_condition, index: true
    add_column :tracked_health_conditions, :range_lower, :float
    add_column :tracked_health_conditions, :range_upper, :float
  end
end
