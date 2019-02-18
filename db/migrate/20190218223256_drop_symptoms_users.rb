class DropSymptomsUsers < ActiveRecord::Migration[5.2]
  def up
    drop_table :symptoms_users, force: :cascade
  end

  def down
    create_join_table :users, :symptoms do |t|
      t.index :user_id
      t.index :symptom_id
    end
  end
end
