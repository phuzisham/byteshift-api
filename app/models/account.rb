class Account < ApplicationRecord
  belongs_to :user
  has_many :lists
  before_save :format_name

  validates_presence_of :name, :user_id

  private

  def format_name
    self.name = name.downcase.titleize
  end
end
