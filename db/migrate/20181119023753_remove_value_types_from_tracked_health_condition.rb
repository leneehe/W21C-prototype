class RemoveValueTypesFromTrackedHealthCondition < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracked_health_conditions, :value_types_id
    add_reference :tracked_health_conditions, :value_type, foreign_key: true
  end
end
