class Ability
  include CanCan::Ability

  def initialize (user)

    if user
      if user.admin?
        can :manage, :users
      elsif user.hrmanager?
        can :read, :all
      elsif user.tableman
        can :read, :all
      end
    end
  end


end
