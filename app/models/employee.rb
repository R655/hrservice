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
  
  def self.date_max date_a, date_b
    if(date_a.to_date > date_b.to_date)
      date_a
    else
      date_b
    end
  end
  
  def self.date_min date_a, date_b
    if(date_a.to_date < date_b.to_date)
      date_a
    else
      date_b
    end
  end

  def self.isect start_date_a, end_date_a, start_date_b, end_date_b
    return date_max(start_date_a, start_date_b), date_min(end_date_a, end_date_b)
  end
  
  def self.isect object, start_date, end_date
    object.each do |o|
      o.start_date, o.end_date = isect o.start_date, o.end_date, start_date, end_date
    end
    return object
  end
  
  def name
    return second_name+' '+first_name[0]+". " +patronymic[0]+"."
  end
  
  def calculate_salary start_date, end_date
   
    date_range_finder_str = 'start_date <= '+end_date+' AND end_date => '+start_date+' AND employee_id = '+self.id 
   
    add_positions = isect EmployeesPrevPosition.where(date_range_finder_str+' AND ismain = false')+add_positions,
                    start_date,
                    end_date
    
    main_positions = isect EmployeesPrevPosition.where(date_range_finder_str+' AND ismain = true') + main_positions, 
                     start_date, 
                     end_date
    
   
    employees_visits = EmployeesVisit.where(
      'date >= ? AND date <= ? AND employee_id = ?',
       start_date.to_date, end_date.to_date, self.id) # main + adds
       
    holidays = Holiday.where(
      'date >= ? AND date <= ?',
       start_date.to_date, end_date.to_date) # only main
       
    
       
    sick_leaves = isect SickLeave.where(date_range_finder_str), start_date, end_date  # only main
       
    vacations = isect Vacation.where(date_range_finder_str), start_date, end_date  # only main
    
    # intersect date ranges
    # (start_m..end_m).to_a & (d1..d2).to_a
        
    dayoff_count = 0
    start_date.to_date.upto(end_date.to_date) do |day| 
      if  dayoff_mask.send((Date::DAYNAMES[day.wday]).downcase)
        dayoff_count += 1
      end
        
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
    
    for_pay_count =
          ev_count + # отработано
           summ(vac_count*vac_coef) + # за отпуск 
           summ(sick_count*sick_coef) # за больничные
    vsego = 30 - dayoff_count - holidays_count    
    zp = for_pay_count/vsego*salary
  end
    
end