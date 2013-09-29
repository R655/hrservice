class SalaryController < ApplicationController
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
     
    @employees_salary = {}
    
    @employees.each do |emp|
      @employees_salary[emp.id] = emp.calculate_salary @start_date, @end_date   
    end
                  
    respond_to do |format|
      format.html { render 'table.haml'}
      format.json { render json: @departments }
    end 
  end

end
