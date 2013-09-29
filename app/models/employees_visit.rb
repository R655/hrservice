class EmployeesVisit < ActiveRecord::Base
  attr_accessible :employee_id, :date

  belongs_to :employee
  
  validates(
      :employee_id,
      :date,

      presence: true
  )

  validates(
    :employee_id,
    uniqueness:{ scope: :date }
  )
  
  def start_date
    date
  end

  def end_date
    date
  end
  
  def salary_factor
    1.0
  end


end