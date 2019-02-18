class ChangeConditionNameToName < ActiveRecord::Migration[5.2]
  def up
    rename_column :symptoms, :condition_name, :name
  end
  def down
    rename_column :symptoms, :name, :condition_name
  end
end
