class RenameInstructionInTackedMedications < ActiveRecord::Migration[5.2]
  def up
    rename_column :tracked_medications, :instruction, :special_instruction
  end

  def down
    rename_column :tracked_medications, :special_instruction, :instruction
  end
end
