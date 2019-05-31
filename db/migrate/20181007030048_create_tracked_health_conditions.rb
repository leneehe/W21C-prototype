class CreateTrackedHealthConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :tracked_health_conditions do |t|
      t.references :user, foreign_key: true
      t.float :severity_score
      t.datetime :last_checked

      t.timestamps
    end
  end
end
