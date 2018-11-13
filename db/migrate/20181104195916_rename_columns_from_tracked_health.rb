class RenameColumnsFromTrackedHealth < ActiveRecord::Migration[5.2]
  def change
    remove_reference :health_conditions, :users
    add_reference :health_conditions, :user, index: true

  end
end
