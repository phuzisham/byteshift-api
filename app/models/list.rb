class List < ApplicationRecord
  has_many :list_items
  belongs_to :store
  belongs_to :account

  validates :account_id, presence: true, numericality: { only_integer: true }
  validates :store_id, presence: true, numericality: { only_integer: true }

  validate :validate_account_id,
           :validate_store_id

  private

  def validate_account_id
    errors.add(:account_id, "doesn't exist") unless Account.exists?(account_id)
  end

  def validate_store_id
    errors.add(:store_id, "doesn't exist") unless Store.exists?(store_id)
  end
end
