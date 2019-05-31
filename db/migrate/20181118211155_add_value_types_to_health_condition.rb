class AddValueTypesToHealthCondition < ActiveRecord::Migration[5.2]
  def change
    create_table :value_types do |t|
      t.string :name
      t.references :health_condition, foreign_key: true

      t.timestamps
    end
    add_reference :tracked_health_conditions, :value_types, foreign_key: true
  end
end
