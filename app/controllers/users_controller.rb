class UsersController < ApplicationController
  active_scaffold :"user" do |conf|
    conf.columns = [
      :email,
      :employee,
      :accountant,
      :admin,
      :hrmanager,
      :tableman,
      :created_at
    ]
    conf.columns[:employee].form_ui = :select
  end
end
