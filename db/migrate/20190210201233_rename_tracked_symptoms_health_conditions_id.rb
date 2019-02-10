class RenameTrackedSymptomsHealthConditionsId < ActiveRecord::Migration[5.2]
  def change
    remove_column :tracked_symptoms, :health_condition_id, index: true
    add_reference :tracked_symptoms, :symptom
  end
end
