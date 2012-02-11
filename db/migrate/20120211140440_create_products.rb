class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :size
      t.float :price

      t.timestamps
    end
  end
end
