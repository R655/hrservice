class DayoffMasksController < ApplicationController
  active_scaffold :"dayoff_mask" do |conf|
    conf.columns = [
        :monday,
        :tuesday,
        :thursday,
        :wednesday,
        :friday,
        :saturday,
        :sunday  
    ]
  end
end
