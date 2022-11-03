class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Reservation
    return unless %w[admin super_admin].include?(user.role.name)

    can :manage, :all
  end
end
