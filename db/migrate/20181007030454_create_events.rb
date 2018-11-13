class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :frequency
      t.string :location
      t.references :event_type, foreign_key: true

      t.timestamps
    end
  end
end
