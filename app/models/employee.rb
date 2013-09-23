class Employee < ActiveRecord::Base
  has_many :employees_positions
  has_many :premia
  has_one :dayoff_mask, dependent: :destroy, foreign_key: :id
  has_many :employees_visits

  attr_accessible(
      :first_name,
      :patronymic,
      :second_name,
      :passport,
      :registration_address,
      :accepted_date,
      :position_id
  )

  validates(
      :first_name,
      :second_name,
      :patronymic,
      :passport,
      :registration_address,
      :accepted_date,
      presence: true
  )

  validates(
      :passport,
      format: {with: /\d{10}/}
  )

  def name
    return second_name+' '+first_name[0]+". " +patronymic[0]+"."
  end
end