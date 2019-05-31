class RemoveFieldsFromSymptoms < ActiveRecord::Migration[5.2]
  def change
    remove_column :symptoms, :normal_range_upper, :float
    remove_column :symptoms, :normal_range_lower, :float
    remove_column :symptoms, :assistance_threshold, :float
    remove_column :symptoms, :unit_of_measure, :string
    remove_column :symptoms, :above_assistance, :boolean
  end
end
