class CreateConditionUserJoinTable < ActiveRecord::Migration[5.2]
  def up
    create_join_table :users, :conditions do |t|
      t.index [:user_id, :condition_id]
      # t.index [:condition_id, :user_id]
    end
  end

  def down 
    drop_table :conditions_users
  end
end
