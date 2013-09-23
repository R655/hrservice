# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
it_department = Department.create(name: 'IT')
coding_department = Department.create(name: 'Coding', department: it_department)
testing_department = Department.create(name: 'Coding', department: it_department)

junior_dev_pos = Position.create(name: 'Junior dev', department: coding_department, salary: 20000)
chief_dev_pos = Position.create(name: 'Chief dev', department: coding_department, salary: 30000)
team_lead_pos = Position.create(name: 'Team leader', department: coding_department, salary: 40000)

junior_tester_pos = Position.create(name: 'Junior tester', department: testing_department, salary: 20000)
chief_tester_pos = Position.create(name: 'Chief tester', department: testing_department, salary: 30000)


