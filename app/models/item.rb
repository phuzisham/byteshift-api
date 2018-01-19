class Item < ApplicationRecord
	belongs_to :category
	belongs_to :store
	before_save :format_name

	validates_presence_of :name, :x, :y, :store_id, :category_id

private
	def format_name
		self.name = self.name.downcase.titleize
	end
end
