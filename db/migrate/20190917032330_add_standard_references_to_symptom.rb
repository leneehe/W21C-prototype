class AddStandardReferencesToSymptom < ActiveRecord::Migration[5.2]
  def up
    add_column :symptoms, :normal_range_upper, :float
    add_column :symptoms, :normal_range_lower, :float
    add_column :symptoms, :assistance_threshold, :float
    add_column :symptoms, :unit_of_measure, :string
    add_column :symptoms, :above_assistance, :boolean, :default => true
  end

  def down
    remove_column :symptoms_users, :normal_range_upper
    remove_column :symptoms_users, :normal_range_lower
    remove_column :symptoms_users, :assistance_threshold
    remove_column :symptoms_users, :unit_of_measure
    remove_column :symptoms_users, :above_assistance
  end
end
