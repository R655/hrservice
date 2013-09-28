class PremiaController < ApplicationController
  active_scaffold :"premium" do |conf|
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
