class List < ApplicationRecord
  has_many :list_items
  has_one :store
  belongs_to :account
end
