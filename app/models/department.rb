class Department < ActiveRecord::Base

  
  belongs_to :department#, dependent: :restrict
  has_many :departments, dependent: :restrict
  
  has_many :positions, dependent: :restrict
  has_many :premia


  attr_accessible :name, :department_id

  validates :name, presence: true
  validates :name, uniqueness: true
  
  def get_employees_recursive
    employees = []
    positions.each do |p|
      employees + p.main_employees
    end
    departments.each do |d|
      employees + d.get_employees_recursive
    end
    employees
  end

end
