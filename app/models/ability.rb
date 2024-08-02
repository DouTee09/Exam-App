class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, [Answer, Subject], user: user
    can [:update, :read], User, user: user


    if user.admin?
      can [:read, :create, :update, :destroy], :all
      can :manage, :all
    end
  end
end
