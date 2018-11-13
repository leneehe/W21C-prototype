class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :description
      t.string :url
      t.float :quality_score
      t.string :content_page

      t.timestamps
    end
  end
end
