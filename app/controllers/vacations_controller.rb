class VacationsController < ApplicationController
  active_scaffold :"vacation" do |conf|
    conf.columns[:employee].form_ui = :select
  end
  

end
