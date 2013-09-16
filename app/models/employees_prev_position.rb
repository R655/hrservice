class EmployeesPrevPosition < ActiveRecord::Base
  belongs_to :employee
  attr_accessible(
      :department_name,
      :position_name,
      :salary,
      :rate,
      :start_date,
      :end_date,
      :employee_id
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




end
