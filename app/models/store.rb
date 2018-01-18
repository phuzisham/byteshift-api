class Store < ApplicationRecord
	has_many :categories_items_stores
	has_many :categories, through: :categories_items_stores
	has_many :items, through: :categories_items_stores
end
