class ConditionsSymptomsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :conditions, :symptoms, table_name: :suggested_symptoms do |t|
      t.index :condition_id
      t.index :symptom_id
      t.boolean :primary_condition, :default => true
    end
  end
end
