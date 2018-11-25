class ChangeDateColumnToStartOnEvents < ActiveRecord::Migration[5.2]
  def up
    rename_column :events, :date, :start
    add_column :events, :end, :datetime
  end

  def down
    rename_column :events, :start, :date
    remove_column :events, :end, :datetime
  end
end
