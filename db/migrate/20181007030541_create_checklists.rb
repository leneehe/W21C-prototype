class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
      t.string :description
      t.references :event, foreign_key: true
      t.string :entry

      t.timestamps
    end
  end
end
