class Store < ApplicationRecord
  has_many :categories
  has_many :items
  before_save :format_fields

  validates_presence_of :name, :address, :phone, :hours
  validates :phone, format: { with: /^(?:\D*\d){10}\D*$/, multiline: true, message: 'Phone number must contain exactly 10 digits [0-9]' }

  private

  def format_fields
    self.name = name.downcase.titleize

    phone = Phoner::Phone.parse self.phone, country_code: '1'

    self.phone = phone.format(:us)

    self.address = StreetAddress::US.parse(address)
  end
end
