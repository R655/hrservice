class Department < ActiveRecord::Base

  
  belongs_to :department
  has_many :departments
  
  has_many :positions
  has_many :premia # если включить то круд перестаёт работать


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
