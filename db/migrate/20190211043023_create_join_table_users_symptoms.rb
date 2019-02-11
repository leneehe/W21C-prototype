class CreateJoinTableUsersSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :symptoms do |t|
      t.index :user_id
      t.index :symptom_id
    end
  end
end
