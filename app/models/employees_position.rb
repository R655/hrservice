class EmployeesPosition < ActiveRecord::Base
  belongs_to :employee
  belongs_to :position


  attr_accessible :employee_id, :position_id, :rate, :rate_pos_start_date

  validates :employee_id, :position_id, :rate, :rate_pos_start_date, presence: true
  validates :employee_id, uniqueness: {scope: :position_id}
  validates :rate, numericality: {
      in: 0.1..2.0
  }

  def name
    position.name + ' ' + rate
  end

end
