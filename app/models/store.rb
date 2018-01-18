class Store < ApplicationRecord
	has_many :categories
	has_many :items
	before_save :case_fields

private
	def case_fields
		self.name = self.name.downcase.titleize
	end
end
