class PremiaController < ApplicationController
  active_scaffold :"premium" do |conf|
    conf.columns[:accrual_type].form_ui = :select 
  end
end
