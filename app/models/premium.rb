class Premium < ActiveRecord::Base
  belongs_to :employee
  belongs_to :department
  belongs_to :accrual_type
  delegate :start_month, to: :accrual_type
  delegate :months_period, to: :accrual_type
  
  attr_accessible(
      :name,
      :salary_factor,
      :salary_add,
      :start_date,
      :end_date,
      :accrual_type_id,
      :employee_id,
      :department_id
  )

  validates(
      :name,
      :salary_factor,
      :start_date,
      :end_date,
      :accrual_type_id,

      presence:  true
  )
  validates :name, uniqueness: true
  validates :name, length: {
      in: 2..20
  }
  validates :salary_factor, numericality: {
      in: 0..1
  }
  validates :salary_add, numericality: {
      greater_than_or_equal_to: 0.00
  }
  
  
end
