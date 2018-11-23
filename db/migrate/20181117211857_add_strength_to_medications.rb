class AddStrengthToMedications < ActiveRecord::Migration[5.2]
  def change
    add_column :medications, :strength, :string
    add_column :medications, :description, :string
    add_column :medications, :instruction, :string
    add_column :medications, :condition_cure, :string
  end
end
