class EmployeesVisitsController < ApplicationController
  active_scaffold :"employees_visit" do |conf|
    conf.columns[:employee].form_ui = :select
  end
  
  def do_new
    super
    @record.date = Date::current    
  end 
  
  def select_table
    @start_date  = Date.today - 15 
    @end_date = @start_date.to_date + 30
    respond_to do |format|
      format.html
    end 
  end
  
  def table
    if params[:department_id] and params[:department_id] != ""
      department = Department.find(params[:id])
      @employees = department.employees
    else
      @employees = Employee.all
    end 
        
    if params[:start_date] and params[:start_date] != ""
      @start_date = params[:start_date]
    else
      @start_date  = Date.today - 15 
    end
    
    if params[:end_date] and params[:end_date] != "" and (params[:end_date] > @start_date)
      @end_date =  params[:end_date]
    else
      @end_date = @start_date.to_date + 30
    end
     
    @employees_visits = EmployeesVisit.where(
      'date >= ? AND date <= ? AND employee_id in (?)',
       @start_date.to_date, @end_date.to_date, @employees.collect{|e| e.id}) 
    @evs = {};
    @employees_visits.each do |ev|
      if(!@evs[ev.employee.id])
        @evs[ev.employee.id] = {}
      end
      @evs[ev.employee.id][ev.date] = true 
    end
                  
    respond_to do |format|
      format.html { render 'table.html.erb'}
      format.json { render json: @departments }
    end 
  end

  def submit_table
    
    notice = "";
    alert = "";
    evs = params[:ev]
    @start_date = params[:start_date]
    @end_date =  params[:end_date]
    if params[:employees_ids]
      EmployeesVisit.where(
        'date >= ? AND date <= ? AND employee_id in (?)',
        @start_date.to_date, @end_date.to_date, params[:employees_ids]).destroy_all
    else
      alert  << "cannot delete old records \n"
    end
    
    evs.each do |ev|
      new_ev = EmployeesVisit.new(JSON.parse(ev)) 
      if(new_ev.save)
        notice << ev << " created succesfully \n"
      else
        alert << ev << " cannot be created \n"
      end
    end
          
    respond_to do |format|
      format.html {  redirect_to :back, alert: alert }
    end
  end
  
end
