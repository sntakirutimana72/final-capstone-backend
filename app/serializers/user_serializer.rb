class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role

  belongs_to :role

  def role
    object.role.name
  end
end
