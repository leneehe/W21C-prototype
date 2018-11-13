class CreateTrackedMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :tracked_medications do |t|
      t.string :prescribed_by
      t.string :instruction
      t.string :dosage
      t.string :frequency
      t.references :user, foreign_key: true
      t.references :medication, foreign_key: true

      t.timestamps
    end
  end
end
