class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :user_id
      t.string :tel
      t.string :address
      t.integer :zip
      t.string :image

      t.timestamps null: false
    end
  end
end
