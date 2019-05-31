class AddUserTrackedToSymptomsUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :symptoms_users, :user_tracked, :boolean, default: false
  end

  def down
    remove_column :symptoms_users, :user_tracked
  end
end
