require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'
require_relative './exercise_7'

puts "Exercise 8"
puts "----------"

@store1.employees.create(first_name: "Ducky", last_name: "Duck", hourly_rate: 75)

ducky = Employee.find_by(first_name: "Ducky")
puts ducky.password


