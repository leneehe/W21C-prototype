class RemoveRoleColumnAddAdmin < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :role
    add_column :users, :admin, :boolean, default: false
    add_column :users, :date_of_birth, :date
  end

  def down
    remove_column :uers, :date_of_birth
    remove_column :users, :admin
    add_column :users, :role, :string
  end
end
