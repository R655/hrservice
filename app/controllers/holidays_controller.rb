class HolidaysController < ApplicationController
  active_scaffold :"holiday" do |conf|
  end
  
  def do_new
    super
    @record.date = Date::current    
  end 
end
