class ListItem < ApplicationRecord
  belongs_to :list
  has_one :item

  validates_presence_of :name

  validates :list_id, presence: true, numericality: { only_integer: true }
  validates :item_id, presence: true, numericality: { only_integer: true }

  validate_list_id :list_id
  validate_item_id :item_id

  private

  def validate_list_id
    errors.add(:list_id, "doesn't exist") unless List.exists?(list_id)
  end

  def validate_item_id
    errors.add(:item_id, "doesn't exist") unless Item.exists?(item_id)
  end
end
