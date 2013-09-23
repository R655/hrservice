class EmployeesVisitsController < ApplicationController
  active_scaffold :"employees_visit" do |conf|
    
  end
  
  def select_table
    respond_to do |format|
      format.html
    end 
  end
  
  def table
    if params[:department_id] != ""
      department = Department.find(params[:id])
      @employees = department.employees
    else
      @employees = Employee.all
    end 
        
    if params[:start_date] != ""
      @start_date = params[:start_date]
    else
      @start_date  = Date.today - 15 
    end
    
    if params[:end_date] != "" and (params[:end_date] > @start_date)
      @end_date =  params[:end_date]
    else
      @end_date = @start_date.to_date + 30
    end
     
    @employees_visits = EmployeesVisit.where('date >= ? AND date <= ?', @start_date, @end_date) # TODO: employee_id in @employees
    @evs = {};
    @employees_visits.each do |ev|
      @evs[ev.employee.id] = {}
      @evs[ev.employee.id][ev.date] = true 
    end
                  
    respond_to do |format|
      format.html { render 'table.html.erb'}
      format.json { render json: @departments }
    end 
  end

  def submit_table
    @evs = params[:ev]
    notice = "";
    alert = "";
    @evs.each do |ev|
      new_ev = EmployeesVisit.new(JSON.parse(ev)) 
      if(new_ev.save)
        notice << ev << " created succesfully \n"
      else
        alert << ev << " cannot be created \n"
      end
    end
          
    respond_to do |format|
      format.html {  redirect_to :back, notice: notice, alert: alert }
        #'table.html.erb', 
         #           params: {
          #            department_id: params[:department_id], 
           #           start_date: params[:start_date], 
            #          end_date: params[:end_date]}, 
             #       
                    
    end
  end
  
end
