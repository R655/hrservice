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
    conf.columns[:rate].options = {
      min: 0.1,
      max: 1.0,
      step: 0.1
    }
    # TODO: set rate options on ostalnoi
  end
end
