class DayoffMask < ActiveRecord::Base
  attr_accessible :friday, :monday, :saturday, :sunday, :thursday, :tuesday, :wednesday, :id
  belongs_to :employee, foreign_key: :id#, dependent: :destroy
  
  def is_dayoff day
    send((Date::DAYNAMES[day.wday]).downcase)
  end
  
  def name
    nm = ''
    i = 0
    Date::DAYNAMES.each do |d|
      if i > 0 
         nm += (send(d.downcase))?'D':'W'
      end
      i += 1
    end
    d = Date::DAYNAMES[0]
    nm += (send(d.downcase))?'D':'W'
    return nm
  end
end
