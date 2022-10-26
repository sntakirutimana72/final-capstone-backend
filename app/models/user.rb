class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  belongs_to :role
  has_many :rooms
  has_many :reservations
  has_many :rooms, through: :reservations

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def my_role
    role&.name || 'client'
  end
end
