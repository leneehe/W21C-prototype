class AddCompleteToChecklists < ActiveRecord::Migration[5.2]
  def change
    add_column :checklists, :complete, :boolean, :default => false
  end
end
