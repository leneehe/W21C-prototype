class RenameValueTypesHealthConditionId < ActiveRecord::Migration[5.2]
  def change
    remove_column :value_types, :health_condition_id
    # remove_reference :value_types, :symptom, index: true, foreign_key: true
    add_reference :value_types, :symptom
  end
end
