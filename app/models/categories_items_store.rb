class CategoriesItemsStore < ApplicationRecord
	self.table_name = "categories_items_stores"

	belongs_to :store
	belongs_to :category
	belongs_to :item
	
end
