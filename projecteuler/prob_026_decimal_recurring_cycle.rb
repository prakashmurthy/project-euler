#!/usr/bin/env ruby
# Solution to problem number 26 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=26

require "../lib/integer_functions"


max_length = 0
max_number = 0
(2..1000).each do |number|
  number_cycle_length = number.recurring_cycle_length 
  if number_cycle_length > max_length
    max_length = number_cycle_length 
    max_number = number
  end
  puts "processed #{number} ....." if number.modulo(50) == 0
end

puts
puts "The number #{max_number} has the max recurring cycle length of #{max_length} for a recurring cycle."