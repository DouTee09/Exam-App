class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, [Answer, Subject], user: user
    can [:update, :read], User, user: user
    can :failed_save, :failed_update

    if user.admin?
      can [:read, :create, :update, :destroy], :all
      can :import, Exam
    end
  end
end
