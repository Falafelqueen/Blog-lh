class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :link
      t.text :categories, array: true
      t.timestamps
    end
  end
end
