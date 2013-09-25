class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = ['hrmanager' ,
           'admin' ,
           'tableman']

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :hrmanager, :tableman
  
  belongs_to :employee
              
  
  def roles
    ROLES.collect do |role|
      if(send(role))
        role
      else
        nil
      end
    end
  end
  
  def name
    email  
  end
  
  def admin?
    admin
  end

  def hrmanager?
    hrmanager
  end

  def tableman?
    tableman
  end

end
