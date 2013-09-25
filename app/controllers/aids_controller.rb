class AidsController < ApplicationController
  active_scaffold :"aid" do |conf|
    conf.columns[:employee].form_ui = :select
    conf.columns[:accrual_type].form_ui = :select
  end
end
