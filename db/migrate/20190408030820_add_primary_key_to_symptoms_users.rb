class AddPrimaryKeyToSymptomsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :symptoms_users, :id, :primary_key
  end
end
