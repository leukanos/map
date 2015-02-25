class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can :read, :all
        can :manage, WorkTime
        if user.manager?
          can :manage, Dictionary
          can :manage, User, id: user.id
          can :manage, Project, assigned_to_id: user.id
        end
      end
  end
end
