rails d scaffold Employees_prev_position
rails d scaffold Employees_current_position
rails d scaffold Employee
rails d scaffold Level
rails d scaffold Position
rails d scaffold Profession
rails d scaffold Department

rails g scaffold Department name:string department:references
rails g scaffold Profession name:string profession:references
rails g scaffold Position name:string department:references profession:references
rails g scaffold Level name:string k:float
rails g scaffold Employee first_name:string second_name:string patronymic:string other_data:string
rails g scaffold Employees_current_position employee:references position:references level:references
rails g scaffold Employees_prev_position employee:references position:references level:references from_date:Date to_date:Date
