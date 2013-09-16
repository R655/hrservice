class EmployeesVisit < ActiveRecord::Base
  attr_accessible :employee_id, :date

  validates(
      :employee_id,
      :date,

      presence: true
  )

  validates(
    :employee_id,
    uniqueness:{ scope: :date }
  )



end