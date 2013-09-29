class Employee < ActiveRecord::Base
  has_many :employees_positions
  
  has_many :add_positions, class_name: EmployeesPosition, conditions: {:is_main => false}
  has_one :main_position, class_name: EmployeesPosition, conditions: {:is_main => true}
  delegate :department, to: :main_position
  
  has_many :premia
  has_one :dayoff_mask, class_name: DayoffMask, foreign_key: :id, dependent: :destroy
  has_one :user
  has_many :employees_visits
  has_many :aids

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

  def date_max date_a, date_b
    if(date_a.to_date > date_b.to_date)
      date_a
    else
      date_b
    end
  end
  
  def date_min date_a, date_b
    if(date_a.to_date < date_b.to_date)
      date_a
    else
      date_b
    end
  end

  def isect start_date_a, end_date_a, start_date_b, end_date_b
    return date_max(start_date_a, start_date_b), date_min(end_date_a, end_date_b)
  end
  
  def isect_all array, start_date, end_date
    array.each do |o|
      o.start_date, o.end_date = isect o.start_date, o.end_date, start_date, end_date
    end
    return array
  end
  
  def isect_obj obj, start_date, end_date
    isect obj.start_date, obj.end_date, start_date, end_date
  end
  
  def isect_objs obj_a, obj_b
    isect obj_a.start_date, obj_a.end_date, obj_b.start_date, obj_b.end_date
  end
  
  def isect_objs_count  obj_a, obj_b
    a, b = isect obj_a.start_date, obj_a.end_date, obj_b.start_date, obj_b.end_date
    count = b.to_date - a.to_date + 1
    count *= obj_b.salary_factor
  end
  
  def isect_obj_array_count obj, array
    count = 0
    array.each do |lol|
      count += isect_objs_count obj, lol
    end
    {count: count, summ: obj.salary*count/30}
  end 
  
  def name
    return second_name+' '+first_name[0]+". " +patronymic[0]+"."
  end
  
  def all_premia
    # всем
    opremia = Premium.where(employee_id: nil, department_id: nil)
    # всему отделу, можно делегировать отделу с кондишеном eid = null
    opremia += Premium.where(employee_id: nil, department_id: department.id)
    # только этому сотруднику 
    opremia += Premium.where(employee_id: id)
    
    opremia
  end
  
  def main_pos_on date
     date_range_finder_str = 'start_date <= '+date+' AND end_date => '+date+' AND employee_id = '+self.id
     main_positions = EmployeesPrevPosition.where(date_range_finder_str+' AND ismain = true')
     if main_position.start_date.to_date <= date 
       main_positions += main_position
     end
     return main_positions 
  end
  
  def get_paydays prem, start_date, end_date
    paydays = []
    payday = Date.new(start_date.to_date.year, start_date.to_date.month, Constants.where(name: 'payday'))
    while payday < end_date.to_date
      if payday > start_date.to_date and (day.month - prem.start_month) % prem.months_period == 0
        paydays << payday
      end
      payday += 1.month
    end  
    paydays
  end
  
  def acc_isects pos, prem
    count = (get_paydays prem, pos.start_date, pos.end_date).size
    summ = (pos.salary*prem.salary_factor + prem.salary_add)*count
    return {count: count, summ: summ}
  end 
  
  def calculate_salary start_date, end_date
   
    date_range_finder_str = 'start_date <= ? AND end_date >= ? AND employee_id = ?'
   
    all_positions = isect_all EmployeesPrevPosition.where(date_range_finder_str, end_date.to_date, start_date.to_date, self.id).all+employees_positions,
                    start_date,
                    end_date
       
    employees_visits = EmployeesVisit.where(
      'date >= ? AND date <= ? AND employee_id = ?',
       start_date.to_date, end_date.to_date, self.id).all # main + adds

       
    holidays = Holiday.where(
      'date >= ? AND date <= ?',
       start_date.to_date, end_date.to_date).all # only main
       
    sick_leaves = isect_all SickLeave.where(date_range_finder_str, end_date.to_date, start_date.to_date, self.id).all, start_date, end_date  # only main
       
    vacations = isect_all Vacation.where(date_range_finder_str, end_date.to_date, start_date.to_date, self.id).all, start_date, end_date  # only main
    
    
    
    wat = {}
    summ = 0.00
    all_positions.each do |pos|
      wat[pos] = {}
      summ += (wat[pos][:ev] = isect_obj_array_count pos, employees_visits)[:summ]
      if pos.is_main
        summ += (wat[pos][:vacations] = isect_obj_array_count pos, vacations)[:summ]
        summ += (wat[pos][:sick_leaves] = isect_obj_array_count pos, sick_leaves)[:summ]
        summ += (wat[pos][:holidays] = isect_obj_array_count pos, holidays)[:summ]
                
        wat[pos][:dayoffs] = {}
        count = 0
        pos.start_date.to_date.upto(pos.end_date.to_date) do |day| 
          count += 1 if dayoff_mask.is_dayoff(day)
        end
        summ +=(wat[pos][:dayoffs] = {count: count, summ: count*pos.salary})[:summ]
        
        
        wat[pos][:premia] = {}
        all_premia.each do |prem|
          summ += (wat[pos][:premia][prem] = acc_isects pos, prem)[:summ]
        end
        
        wat[pos][:aids] = {}
        aids.each do |prem|
          summ += (wat[pos][:premia][prem] = acc_isects pos, prem)[:summ]
        end   
      end
    end
    return {summ: summ, details: wat}
  end
    
end