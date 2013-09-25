class Employee < ActiveRecord::Base
  has_many :employees_positions
  
  has_many :add_positions, class_name: EmployeesPosition, conditions: {:is_main => false}
  has_one :main_position, class_name: EmployeesPosition, conditions: {:is_main => true}
  
  has_many :premia
  has_one :dayoff_mask, dependent: :destroy, foreign_key: :id
  has_one :user
  has_many :employees_visits

  attr_accessible(
      :first_name,
      :patronymic,
      :second_name,
      :passport,
      :registration_address,
      :accepted_date
  )

  validates(
      :first_name,
      :second_name,
      :patronymic,
      :passport,
      :registration_address,
      :accepted_date,
      :main_position,
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