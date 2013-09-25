class EmployeesPositionsController < ApplicationController
  active_scaffold :"employees_position" do |conf|
    conf.columns = [
      :employee,
      :position,
      :rate,
      :rate_pos_start_date
    ]
    conf.columns[:employee].form_ui = :select
    conf.columns[:position].form_ui = :select
  end
end
