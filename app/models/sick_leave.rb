class SickLeave < ActiveRecord::Base

  belongs_to :employee

  attr_accessible(
      :start_date,
      :end_date,
      :employee_id,
      :salary_factor
  )

  validates :salary_factor, numericality: {
      in: 0..1
  }

end