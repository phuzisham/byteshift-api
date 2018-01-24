class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.integer :account_id
      t.integer :store_id

      t.timestamps
    end
  end
end
