class EmployeesController  < ApplicationController
  # before_filter :authenticate_user!
  active_scaffold :"employee" do |conf|
    conf.columns = [
      :accepted_date,
      :first_name,
      :second_name,
      :patronymic,
      :registration_address,
      :dayoff_mask,
      :passport,
      :main_position,
      :add_positions,
      #:aids,
      #:premia,
      #:sick_leaves,
      #:vacations
      
    ]
    #conf.columns[:accepted_date].options = {:format => :short}
    conf.columns[:add_positions].show_blank_record = false
    conf.columns[:dayoff_mask].show_blank_record = false
    conf.columns[:aids].show_blank_record = false
    conf.columns[:premia].show_blank_record = false
    conf.columns[:sick_leaves].show_blank_record = false
    conf.columns[:vacations].show_blank_record = false
   # conf.columns[:premia].options[:exclude] :department
  end
  
  def do_new
    super
    @record.dayoff_mask = DayoffMask.new
        
  end  
  
end