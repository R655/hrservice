class SickLeavesController < ApplicationController
  active_scaffold :"sick_leave" do |conf|
    conf.columns = [
      :employee,
      :start_date,
      :end_date,
      :salary_factor
    ]
    conf.columns[:employee].form_ui = :select
  end
end
