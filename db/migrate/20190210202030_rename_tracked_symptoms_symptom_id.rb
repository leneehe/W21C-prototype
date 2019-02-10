class RenameTrackedSymptomsSymptomId < ActiveRecord::Migration[5.2]
  def up
    remove_column :tracked_symptoms, :symptoms_id, index: true
    add_reference :tracked_symptoms, :symptom
  end

  def down 
    # drop_table :table_name
  end
end
