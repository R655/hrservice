class Position < ActiveRecord::Base
  belongs_to :department

  attr_accessible :name, :department_id, :salary
  
  has_many :employees_positions
  has_many :employees, through: :employees_positions
  
  def main_employees
    result = []
    employees_positions.each do |ep|
      if ep.is_main
        result.push(ep.employee)
      end
    end
    result
  end 

  after_save :modify_history

  validates :name, presence: true, uniqueness: true

  validates :salary, numericality: {
      greater_than: 0.01
  }

  def modify_history
    nil
  end
end
