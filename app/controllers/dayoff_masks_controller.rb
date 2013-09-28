class DayoffMasksController < ApplicationController
  active_scaffold :"dayoff_mask" do |conf|
    conf.columns = [
        :monday,
        :tuesday,
        :thursday,
        :wednesday,
        :friday,
        :saturday,
        :sunday,
        :employee
    ]
    conf.columns[:employee].form_ui = :select
    #conf.columns[:saturday].form_ui = :select
  end
end
