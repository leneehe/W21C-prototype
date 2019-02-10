class AddTrackedSymptomUserFk < ActiveRecord::Migration[5.2]
  def change
    add_reference :tracked_symptoms, :user, index: true
    add_foreign_key :tracked_symptoms, :users
  end
end
