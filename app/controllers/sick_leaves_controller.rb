class SickLeavesController < ApplicationController
  active_scaffold :"sick_leave" do |conf|
    conf.columns = [
      :employee,
      :start_date,
      :end_date,
      :salary_factor
    ]
    conf.columns[:employee].form_ui = :select
    conf.columns[:salary_factor].options = {
      min: 0.01,
      max: 1.00,
      step: 0.01
    }
   
  end
end
