class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :x
      t.integer :y
      t.integer :store_id
      t.integer :category_id

      t.timestamps
    end
  end
end
