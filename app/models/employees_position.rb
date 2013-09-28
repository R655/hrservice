class EmployeesPosition < ActiveRecord::Base
  belongs_to :employee#, dependent: :delete
  belongs_to :position#, dependent: :restrict


  attr_accessible :employee_id, :position_id, :rate, :rate_pos_start_date

  #validates :employee_id, :position_id, :rate, :rate_pos_start_date, presence: true
  validates :employee_id, uniqueness: {scope: :position_id}
  validates :rate, numericality: {
      in: 0.1..2.0
  }
  
  def start_date
    rate_pos_start_date
  end
  
  def end_date
    Date::current
  end
  
  delegate :department, to: :position
  def name
    if rate != 1.0
      position.name + ' (' + rate.to_s + ')'
    else
      position.name
    end
  end

end
