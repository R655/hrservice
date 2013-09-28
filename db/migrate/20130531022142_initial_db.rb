class InitialDb < ActiveRecord::Migration
  
  def change
    
    create_table "accrual_types", :force => true do |t|
      t.string  "name",          :limit => 20,                :null => false, :unique => true
      t.integer "start_month",                 :default => 1, :null => false
      t.integer "months_period",               :default => 1, :null => false
    end
  
    add_index "accrual_types", ["name"], :unique => true
  
    create_table "aids", :force => true do |t|
      t.string  "name",            :limit => 100, :unique => true
      t.integer "accrual_type_id",                                                                :null => false
      t.integer "employee_id",                                                                    :null => false
      t.decimal "salary_add",                     :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.float   "salary_factor",                                                 :default => 0.0, :null => false
    end
  
    add_index "aids", ["name"], :unique => true
    add_index "aids", ["accrual_type_id"], :name => "aid_acctypeFK"
    add_index "aids", ["employee_id"], :name => "aid_employeesFK"
  
    create_table "dayoff_masks", :force => true do |t|
      t.boolean "monday",    :default => false, :null => false
      t.boolean "tuesday",   :default => false, :null => false
      t.boolean "wednesday", :default => false, :null => false
      t.boolean "thursday",  :default => false, :null => false
      t.boolean "friday",    :default => false, :null => false
      t.boolean "saturday",                     :null => false
      t.boolean "sunday",    :default => true,  :null => false
    end
  
    create_table "departments", :force => true do |t|
      t.string  "name",          :limit => 20, :null => false, :unique => true
      t.integer "department_id", :null => true
    end
  
    add_index "departments", ["name"], :unique => true
    add_index "departments", ["department_id"], :name => "parent_departmentsFK"
  
    create_table "employees", :force => true do |t|
      t.string  "first_name",          :limit => 20,  :null => false
      t.string  "second_name",         :limit => 20,  :null => false
      t.string  "patronymic",          :limit => 20,  :null => false
      t.string  "passport",            :limit => 10,  :null => false, :unique => true
      t.string  "registration_address", :limit => 100, :null => false
      t.date    "accepted_date",                      :null => false
    end
    
    add_index "employees", ["passport"], :unique => true
    add_index "employees", ["first_name", "second_name", "patronymic"], :name => "first_name", :unique => true
  
    create_table "employees_positions", :force => true do |t|
      t.integer "employee_id",                          :null => false
      t.integer "position_id",                          :null => false
      t.float   "rate",                :default => 1.0, :null => false
      t.date    "rate_pos_start_date",                  :null => false
      t.boolean "is_main", :default => true, :null => false
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
      t.string  "name",          :limit => 20,    :unique => true,                            :null => false
      t.integer "department_id",                                              :null => false
      t.decimal "salary",                      :precision => 10, :scale => 2, :null => false
    end
    
    add_index "positions", ["name"], :unique => true
    add_index "positions", ["department_id"], :name => "pos_departmentFK"
  
    create_table "premia", :force => true do |t|
      t.string  "name",            :limit => 100, :unique => true,                                :null => false
      t.integer "employee_id"
      t.integer "department_id"
      t.integer "accrual_type_id",                                                                :null => false
      t.decimal "salary_add",                     :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.float   "salary_factor",                                                 :default => 0.0, :null => false
      t.date    "start_month",                                                                    :null => false
      t.date    "end_month"
    end
  
    add_index "premia", ["name"], :unique => true
    add_index "premia", ["accrual_type_id"], :name => "prem_acctypeFK"
    add_index "premia", ["department_id"], :name => "prem_depFK"
    add_index "premia", ["employee_id"], :name => "prem_employeesFK"
  
    create_table "sick_leaves", :force => true do |t|
      t.integer "employee_id",                    :null => false
      t.date    "start_date",                     :null => false
      t.date    "end_date",                       :null => false
      t.float   "salary_factor", :default => 1.0, :null => false
    end
  
    add_index "sick_leaves", ["employee_id"], :name => "sick_leaves_employee_idFK"
  
    create_table "vacations", :force => true do |t|
      t.integer "employee_id", :null => false
      t.date    "start_date",  :null => false
      t.date    "end_date",    :null => false
    end
  
    add_index "vacations", ["employee_id"], :name => "vacations_employee_idFK"
    
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token


      t.integer :employee_id,  :default => nil

      t.boolean :admin, :null => false, :default => false
      t.boolean :accountant, :null => false, :default => false
      t.boolean :hrmanager, :null => false, :default => false
      t.boolean :tableman, :null => false, :default => false

      t.timestamps
      
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
  end

end
