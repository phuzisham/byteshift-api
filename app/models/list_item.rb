class ListItem < ApplicationRecord
  belongs_to :list
  has_one :item
end
