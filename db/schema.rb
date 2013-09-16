# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130531022142) do

  create_table "accrual_types", :force => true do |t|
    t.string  "name",          :limit => 20,                :null => false
    t.integer "start_month",                 :default => 1, :null => false
    t.integer "months_period",               :default => 1, :null => false
  end

  create_table "aids", :force => true do |t|
    t.string  "name",            :limit => 100
    t.integer "accrual_type_id",                                                                :null => false
    t.integer "employee_id",                                                                    :null => false
    t.decimal "salary_add",                     :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.float   "salary_factor",                                                 :default => 0.0, :null => false
  end

  add_index "aids", ["accrual_type_id"], :name => "aid_acctypeFK"
  add_index "aids", ["employee_id"], :name => "aid_employeesFK"

  create_table "dayoff_masks", :force => true do |t|
    t.boolean "monday",    :default => false, :null => false
    t.boolean "tuesday",   :default => false, :null => false
    t.boolean "wednesday", :default => false, :null => false
    t.boolean "thursday",  :default => false, :null => false
    t.boolean "friday",    :default => false, :null => false
    t.boolean "saturday",  :default => true,  :null => false
    t.boolean "sunday",    :default => true,  :null => false
  end

  create_table "departments", :force => true do |t|
    t.string  "name",          :limit => 20, :null => false
    t.integer "department_id"
  end

  add_index "departments", ["department_id"], :name => "parent_departmentsFK"

  create_table "employees", :force => true do |t|
    t.string  "first_name",          :limit => 20,  :null => false
    t.string  "second_name",         :limit => 20,  :null => false
    t.string  "patronymic",          :limit => 20,  :null => false
    t.string  "passport",            :limit => 10,  :null => false
    t.string  "registration_adress", :limit => 100, :null => false
    t.date    "accepted_date",                      :null => false
    t.integer "position_id",                        :null => false
  end

  add_index "employees", ["first_name", "second_name", "patronymic"], :name => "first_name", :unique => true

  create_table "employees_positions", :force => true do |t|
    t.integer "employee_id",                          :null => false
    t.integer "position_id",                          :null => false
    t.float   "rate",                :default => 1.0, :null => false
    t.date    "rate_pos_start_date",                  :null => false
  end

  add_index "employees_positions", ["employee_id", "position_id"], :name => "employee_id", :unique => true
  add_index "employees_positions", ["position_id"], :name => "pos_posFK"

  create_table "employees_prev_positions", :force => true do |t|
    t.integer "employee_id",                                                  :null => false
    t.string  "department_name", :limit => 20,                                :null => false
    t.string  "position_name",   :limit => 20,                                :null => false
    t.decimal "salary",                        :precision => 10, :scale => 2, :null => false
    t.float   "rate",                                                         :null => false
    t.date    "start_date",                                                   :null => false
    t.date    "end_date"
  end

  add_index "employees_prev_positions", ["employee_id"], :name => "employees_historyFK"

  create_table "employees_visits", :force => true do |t|
    t.integer "employee_id", :null => false
    t.date    "date",        :null => false
  end

  add_index "employees_visits", ["employee_id", "date"], :name => "employee_id", :unique => true

  create_table "holidays", :force => true do |t|
    t.string "name", :limit => 30, :null => false
    t.date   "date",               :null => false
  end

  add_index "holidays", ["name"], :name => "name", :unique => true

  create_table "positions", :force => true do |t|
    t.string  "name",          :limit => 20,                                :null => false
    t.integer "department_id",                                              :null => false
    t.decimal "salary",                      :precision => 10, :scale => 2, :null => false
  end

  add_index "positions", ["department_id"], :name => "pos_departmentFK"

  create_table "premiums", :force => true do |t|
    t.string  "name",            :limit => 100,                                                 :null => false
    t.integer "employee_id"
    t.integer "department_id"
    t.integer "accrual_type_id",                                                                :null => false
    t.decimal "salary_add",                     :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.float   "salary_factor",                                                 :default => 0.0, :null => false
    t.date    "start_month",                                                                    :null => false
    t.date    "end_month"
  end

  add_index "premiums", ["accrual_type_id"], :name => "prem_acctypeFK"
  add_index "premiums", ["department_id"], :name => "prem_depFK"
  add_index "premiums", ["employee_id"], :name => "prem_employeesFK"

  create_table "seek_leaves", :force => true do |t|
    t.integer "employee_id",                    :null => false
    t.date    "start_date",                     :null => false
    t.date    "end_date",                       :null => false
    t.float   "salary_factor", :default => 1.0, :null => false
  end

  add_index "seek_leaves", ["employee_id"], :name => "seek_leaves_employee_idFK"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "employee_id"
    t.boolean  "admin",                  :default => false, :null => false
    t.boolean  "accountant",             :default => false, :null => false
    t.boolean  "hrmanager",              :default => false, :null => false
    t.boolean  "tableman",               :default => false, :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vacations", :force => true do |t|
    t.integer "employee_id", :null => false
    t.date    "start_date",  :null => false
    t.date    "end_date",    :null => false
  end

  add_index "vacations", ["employee_id"], :name => "vacations_employee_idFK"

end
