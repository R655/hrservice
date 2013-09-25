class EmployeesPositionsController < ApplicationController
  active_scaffold :"employees_position" do |conf|
    conf.columns = [
      :employee,
      :position,
      :rate,
      :is_main,
      :rate_pos_start_date
    ]
    conf.columns[:employee].form_ui = :select
    conf.columns[:position].form_ui = :select
    conf.columns[:is_main].form_ui = :radio_button
    conf.columns[:rate_pos_start_date].options = {:format => :short}
  end
end
