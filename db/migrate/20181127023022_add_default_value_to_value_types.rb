class AddDefaultValueToValueTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :value_types, :name, :string, :default => 'Amount'
  end
end
