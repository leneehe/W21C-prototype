class RemoveExtraColumnsFromTrackedHealth < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tracked_health_conditions, :user
    remove_column :tracked_health_conditions, :range_lower
    remove_column :tracked_health_conditions, :range_upper

    add_reference :health_conditions, :user, index: true

  end
end
