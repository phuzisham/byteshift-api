class ListItem < ApplicationRecord
  belongs_to :list
  has_one :item

  validates_presence_of :name, :list_id, :item_id
end
