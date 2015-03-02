class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, WorkTime
      can :manage, User, id: user.id

      if user.manager?
        can :manage, Dictionary
        can :manage, Project, assigned_to_id: user.id
      end
    end
  end
end
