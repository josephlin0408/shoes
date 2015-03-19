class CreateStoreProducts < ActiveRecord::Migration
  def change
    create_table :store_products do |t|
      t.string :name
      t.string :category
      t.integer :store_id
      t.integer :origin_price
      t.integer :price
      t.integer :size
      t.string :image
      t.text :content

      t.timestamps null: false
    end
  end
end
