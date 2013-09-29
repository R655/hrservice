class EmployeesPosition < ActiveRecord::Base
  belongs_to :employee#, dependent: :delete
  belongs_to :position#, dependent: :restrict


  attr_accessible :employee_id, :position_id, :rate, :rate_pos_start_date

  validates :position_id, :rate, :rate_pos_start_date, presence: true
  validates :employee_id, uniqueness: {scope: :position_id}
  validates :rate, numericality: {
      in: 0.1..2.0
  }
  
  def name
    if rate != 1.0
      position.name + ' (' + rate.to_s + ')'
    else
      position.name
    end
  end
  
  def modify_history_after_del
    if !employee_id
      return nil
    end
    
    evs = EmployeesVisit.where('date >= ? AND employee_id = ?', rate_pos_start_date, employee_id).all
    if evs.count > 0
      prev_pos = EmployeesPrevPosition.new(
          employee_id: employee_id,
          department_name: position.department.name,
          position_name: position.name,
          salary: position.salary,
          rate: rate,
          start_date: rate_pos_start_date,
          end_date: Date::current,
          is_main: is_main
        )
      prev_pos.save
    end
  end
  
  def start_date= date
    rate_pos_start_date = date
  end
  
  def end_date= date
    @tmp_end_date = date
  end
  
  def salary
    rate*position.salary
  end
  
  def start_date
    rate_pos_start_date
  end
  
  def end_date
    if @tmp_end_date == nil
      "31-12-3000"
    else
      @tmp_end_date
    end
  end
  
  delegate :department, to: :position



end
