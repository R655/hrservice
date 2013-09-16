class Premium < ActiveRecord::Base
  belongs_to :employee
  belongs_to :department
  belongs_to :accrual_type

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
      in: 2..20,
      wrong_length: 'Необходимо 2..20 символов в названии'
  }
  validates :salary_factor, numericality: {
      in: 0..1
  }
  validates :salary_add, numericality: {
      greater_than: 0.01
  }
end
