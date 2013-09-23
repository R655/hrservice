class AccrualTypesController < ApplicationController
  active_scaffold :"accrual_type" do |conf|
     conf.columns = [
      :name,
      :start_month,
      :months_period
    ]
  end
end
