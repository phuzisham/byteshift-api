class Category < ApplicationRecord
  belongs_to :store
  has_many :items
  before_save :format_name

  validates_presence_of :name, :lx, :rx, :ty, :by, :store_id

  private

  def format_name
    self.name = name.downcase.titleize
  end
end
