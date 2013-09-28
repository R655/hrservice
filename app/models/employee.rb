class Employee < ActiveRecord::Base
  has_many :employees_positions
  
  has_many :add_positions, class_name: EmployeesPosition, conditions: {:is_main => false}
  has_one :main_position, class_name: EmployeesPosition, conditions: {:is_main => true}
  delegate :department, to: :main_position
  
  has_many :premia
  has_one :dayoff_mask, class_name: DayoffMask, foreign_key: :id, dependent: :destroy
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
      :dayoff_mask,
      presence: true
  )

  validates(
      :passport,
      format: {with: /\d{10}/}
  )


  def name
    return second_name+' '+first_name[0]+". " +patronymic[0]+"."
  end
  
  def calculate_salary start_date, end_date
   
    employees_visits = EmployeesVisit.where(
      'date >= ? AND date <= ? AND employee_id = ?',
       start_date.to_date, end_date.to_date, id)
       
    old_positions = EmployeesPrevPosition.where(
    'start_date >= ? AND end_date <= ? AND employee_id = ?',
       end_date.to_date, start_date.to_date, id)
       
    sick_leaves = SickLeave.where(
    'start_date >= ? AND end_date <= ? AND employee_id = ?',
       end_date.to_date, start_date.to_date, id)
       
    holidays = Holiday.where(
      'date >= ? AND date <= ?',
       start_date.to_date, end_date.to_date, id)
       
    vacations = Vacation.where(
      'start_date >= ? AND end_date <= ? AND employee_id = ?',
       end_date.to_date, start_date.to_date, id)
    
    dayoff_count = 0; 
    start_date.to_date.upto(end_date.to_date) do |day| 
      if  dayoff_mask.send((Date::DAYNAMES[day.wday]).downcase)
        dayoff_count += 1
      end
        #vacations
        #sick_leaves. each
        # if day in sick_leave
          #  add day
          
        #holidays
        #holidays = Holiday.where(date: day)
        #if day.day == Constants.where(name: 'payday')
          # всем
         # premia = Premium.where(employee_id: null, department_id: null) 
          # всему отделу, можно делегировать отделу с кондишеном eid = null
         # premia = Premium.where(employee_id: null, department_id: department.id)
          # только этому сотруднику 
          #premia + Premium.where(employee_id: id)
          #aids
          #premia   
        #end
    end
    # (start_m..end_m).to_a & (d1..d2).to_a
    # vac_count = Date::intersect(date1s, date1e, date2s, date2e)
    count = dayoff_count 
          + ev_count 
          + summ(vac_count*vac_coef) 
          + summ(sick_count*sick_coef)    
  end
    
end