class Store < ApplicationRecord
	has_many :categories
	has_many :items
	before_save :format_fields

	validates_presence_of :name, :address, :phone, :hours

private
	def format_fields
		self.name = self.name.downcase.titleize
		pn = Phoner::Phone.parse self.phone, :country_code => '1'
		self.phone = pn.format(:us)
	end
end
