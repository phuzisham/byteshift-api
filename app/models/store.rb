class Store < ApplicationRecord
	has_many :categories
	has_many :items
	before_save :format_fields

	validates_presence_of :name, :address, :phone, :hours
	# validates :phone, length: { :minimum => 10, :maximum => 10, :message => 'Phone number must be 10 digits with no special characters.' }

private
	def format_fields
		self.name = self.name.downcase.titleize

		phone = Phoner::Phone.parse self.phone, :country_code => '1'
		self.phone = phone.format(:us)

		self.address = StreetAddress::US.parse(self.address)
	end
end
