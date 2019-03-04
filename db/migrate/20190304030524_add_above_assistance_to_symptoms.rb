class AddAboveAssistanceToSymptoms < ActiveRecord::Migration[5.2]
  def up
    add_column :symptoms, :above_assistance, :boolean, :default => true
  end

  def down
    remove_column :symptoms, :above_assistance
  end
end
