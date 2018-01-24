class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :lx
      t.integer :rx
      t.integer :ty
      t.integer :by
      t.integer :store_id
      
      t.timestamps
    end
  end
end
