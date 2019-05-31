class AddFieldsToSymptomsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :symptoms_users, :normal_range_upper, :float
    add_column :symptoms_users, :normal_range_lower, :float
    add_column :symptoms_users, :assistance_threshold, :float
    add_column :symptoms_users, :unit_of_measure, :string
    add_column :symptoms_users, :above_assistance, :boolean, :default => true
  end
end
