class SickLeave < ActiveRecord::Base

  belongs_to :employee

  attr_accessible(
      :start_date,
      :end_date,
      :employee_id,
      :salary_factor
  )

  validates :salary_factor, numericality: {
      in: 0.0..1.0
  }

  def name
   start_date
  end
end