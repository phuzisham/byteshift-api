class CreateCategoriesItemsStores < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_items_stores do |t|
      t.integer :store_id
      t.integer :category_id
      t.integer :item_id

      t.timestamps
    end
  end
end
