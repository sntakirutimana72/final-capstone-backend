class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Room
    can :read, RoomType
    can :read, Accomodation
    can :manage, Reservation

    return unless %w[admin super_admin].include?(user.role.name)

    can :manage, :all
  end
end
