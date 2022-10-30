class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  belongs_to :role
  has_many :rooms
  has_many :reservations
  has_many :rooms, through: :reservations

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  ROLES = %w[super_admin admin client].freeze

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
      # self.role.name == role_name
    end
  end
end
