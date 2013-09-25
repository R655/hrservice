class HolidaysController < ApplicationController
  active_scaffold :"holiday" do |conf|
    conf.columns[:date].options = {:format => :short}
  end
end
