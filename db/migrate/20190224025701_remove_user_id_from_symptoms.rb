class RemoveUserIdFromSymptoms < ActiveRecord::Migration[5.2]
  def change
    remove_reference :symptoms, :user, index: true
  end
end
