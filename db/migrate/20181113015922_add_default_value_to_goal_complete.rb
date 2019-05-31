class AddDefaultValueToGoalComplete < ActiveRecord::Migration[5.2]
  def up
    add_column :goals, :complete, :boolean, default: false
  end

  def down
    remove_column :goals, :complete
  end
end
