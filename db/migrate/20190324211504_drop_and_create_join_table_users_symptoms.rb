class DropAndCreateJoinTableUsersSymptoms < ActiveRecord::Migration[5.2]
  def up
    drop_join_table :users, :symptoms

    create_join_table :users, :symptoms do |t|
      t.index [:user_id, :symptom_id]
      # t.index [:symptom_id, :user_id]
    end
  end
end
