class DropValueTypes < ActiveRecord::Migration[5.2]
  def up
    drop_table :value_types, force: :cascade
  end

  def down
    create_table :value_types do |t|
      t.string :name, default: "Amount"
      t.references :symptom
    end

    add_index :value_types, :symptom_id
  end
end
