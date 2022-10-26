class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  belongs_to :role
  has_many :rooms
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def my_role
    role&.name || 'client'
  end
end
