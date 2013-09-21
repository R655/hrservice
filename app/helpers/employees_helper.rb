module EmployeesHelper
  def employee_accepted_date_form_column(record, options)
    # with date_select we can use :name
    date_select :record, :accepted_date, options
    # but if we used select_date we would have to use :prefix
    #select_date record[:date_received], options.merge(:prefix => options[:name])
  end
end
