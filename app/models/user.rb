class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  has_one :account

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # :confirmable, :omniauthable

  # Devise seems to do a lot/most of the validations for us....
  # Known built in validations:
  # * password.length > 8
  # * email presence
  # * email likeness validation (@blahblah.com)
  # * email uniqueness

  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { username.present? }
  # validate :password_complexity

  # Needs to have a lowercase, uppercase, and be at least 8 characters long
  # def password_complexity
  #   if password.present?
  #     if !password.match(/^(?=.*[a-z])/)
  #       errors.add :password, "doesn't contain a lowercase letter"
  #     elsif !password.match(/^(?=.*[A-Z])/)
  #       errors.add :password, "doesn't contain an uppercase letter"
  #     elsif password.length < 8
  #       errors.add :password, 'needs to be at least 8 characters long'
  #     end
  #   end
  # end
end
