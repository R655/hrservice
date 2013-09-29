class PremiaController < ApplicationController
  active_scaffold :"premium" do |conf|
    conf.columns = [
      :name,
      :start_date,
      :end_date,
      :accrual_type,
      :department,
      :employee,
      :salary_factor,
      :salary_add
    ]
    
    
    conf.columns[:accrual_type].form_ui = :select 
    conf.columns[:employee].form_ui = :select
    conf.columns[:department].form_ui = :select
    conf.columns[:salary_factor].options = {
      min: 0.00,
      max: 1.00,
      step: 0.01
    }
    conf.columns[:salary_add].options = {
      min: 0.00,
      max: 1000000.00,
      step: 0.01
    }
  end
 
end
