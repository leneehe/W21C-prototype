class RenameSymptomsAssociatedTables < ActiveRecord::Migration[5.2]
  def up
    rename_table :health_conditions, :symptoms
    rename_table :tracked_health_conditions, :tracked_symptoms
  end

  def down 
    rename_table :symptoms, :health_conditions
    rename_table :tracked_symptoms, :tracked_health_conditions
  end
end
