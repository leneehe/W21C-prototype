class CreateInternalContents < ActiveRecord::Migration[5.2]
  def change
    create_table :internal_contents do |t|
      t.references :resource, foreign_key: true

      t.timestamps
    end
  end
end
