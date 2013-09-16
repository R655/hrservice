class Vacation < ActiveRecord::Base

  belongs_to :employee

  attr_accessible(
      :start_date,
      :end_date,
      :employee_id
  )

end