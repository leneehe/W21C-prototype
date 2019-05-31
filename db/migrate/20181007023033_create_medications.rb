class CreateMedications < ActiveRecord::Migration[5.2]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :rx_photograph_link
      t.string :link

      t.timestamps
    end
  end
end
