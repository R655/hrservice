class EmployeesPrevPosition < ActiveRecord::Base
  belongs_to :employee
  attr_accessible(
      :department_name,
      :position_name,
      :salary,
      :rate,
      :start_date,
      :end_date,
      :employee_id,
      :is_main
  )

  validates(
      :department_name,
      :position_name,
      :salary,
      :rate,
      :start_date,
      :end_date,
      :employee_id,
      presence: true
  )

  validates :rate, numericality: {
      in: 0.1..2.0
  }
  validates :salary, numericality: {
      greater_than: 0.01
  }

  def name
    if rate != 1.0
      position_name + ' (' + rate.to_s + ')'
    else
      position_name
    end
  end


end
