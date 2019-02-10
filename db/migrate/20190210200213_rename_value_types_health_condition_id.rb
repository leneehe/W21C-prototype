class RenameValueTypesHealthConditionId < ActiveRecord::Migration[5.2]
  def change
    remove_column :value_types, :health_condition_id, index: true
    # remove_reference :value_types, :symptom, index: true, foreign_key: true
    add_reference :value_types, :symptom, index: true
    add_foreign_key :value_types, :symptoms
  end
end
