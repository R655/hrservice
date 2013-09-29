class Ability
  include CanCan::Ability

  def initialize (user)


    #can :read, :employees_positions
    
    #can :manage, :all
    if user
      if user.admin?
        can :manage, User
        can :manage, Employee
        can :manage, Constants
        can :manage, Holiday
      elsif user.hrmanager?        
        can :manage, AccrualType
        can :manage, Aid
        can :manage, DayoffMask
        can :manage, Department
        can :manage, Employee
        can :manage, EmployeesPosition
        can :manage, EmployeesPrevPosition
        can :manage, Holiday
        can :manage, Position
        can :manage, Premium
        can :manage, SickLeave
        can :manage, Vacation
      elsif user.tableman
        can :manage, EmployeesVisit
        can :manage, DayoffMask
        can :read, Holiday
        can :read, Vacation
        can :read, SickLeave
      elsif user.accountant
        can :manage, AccrualType
        can :manage, Position
        can :manage, Premium
        can :manage, Aid
        can :manage, :salary
      end
    end
  end


end
