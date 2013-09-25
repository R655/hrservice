class EmployeesController  < ApplicationController
  # before_filter :authenticate_user!
  active_scaffold :"employee" do |conf|
    conf.columns = [
      :accepted_date,
      :first_name,
      :second_name,
      :patronymic,
      :registration_address,
      :dayoff_mask,
      :passport,
      :main_position,
      :add_positions
    ]
    conf.columns[:accepted_date].options = {:format => :short}
    conf.columns[:add_positions].show_blank_record = false
  end
end