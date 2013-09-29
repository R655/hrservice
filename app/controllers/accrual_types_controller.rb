class AccrualTypesController < ApplicationController
  active_scaffold :"accrual_type" do |conf|
     conf.columns = [
      :name,
      :start_month,
      :months_period
    ]
    conf.columns[:start_month].options = {
      min: 1,
      max: 12,
      step: 1
    }
    conf.columns[:months_period].options = {
      min: 1,
      max: 12,
      step: 1
    }
  end
end
