class CreateStoreProductCategoryships < ActiveRecord::Migration
  def change
    create_table :store_product_categoryships do |t|
      t.integer :store_id
      t.string :product_category_id

      t.timestamps null: false
    end
  end
end
