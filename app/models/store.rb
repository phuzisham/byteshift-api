class Store < ApplicationRecord
	has_many :categories
	has_many :items
	before_save :format_fields

	validates_presence_of :name, :address, :phone, :hours

private
	def format_fields
		self.name = self.name.downcase.titleize

		phone = Phoner::Phone.parse self.phone, :country_code => '1'
		self.phone = phone.format(:us)

		self.address = StreetAddress::US.parse(self.address)
	end
end
