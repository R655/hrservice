class Ability
  include CanCan::Ability

  def initialize (user)

    can :manage, :all
    #if user
    #  if user.admin?
    #    can :manage, :users
    #  elsif user.hrmanager?
    #    can :manage, :all
    #  elsif user.tableman
    #    can :manage, :all
    #  end
    #end
  end


end
