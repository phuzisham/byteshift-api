class CategoriesItemsStore < ApplicationRecord
	self.table_name = "categories_items_stores"

	belongs_to :stores
	belongs_to :categories
	belongs_to :items
	
end
