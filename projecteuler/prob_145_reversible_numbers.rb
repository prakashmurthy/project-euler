#!/usr/bin/env ruby
# Solution to problem number 145 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=145
# projecteuler/prob_145_reversible_numbers.rb

require "../lib/integer_functions"

start_time = Time.new

# puts 1234.reverse
# 
# puts 1313.has_only_odd_digits?
# puts 13013.has_only_odd_digits?

MAX_NUMBER = 1_000_000_000

reversibles_array = []

for number in 10..MAX_NUMBER
  puts "Now processing #{number}...." if number.modulo(100_000) == 0
  next if number.modulo(10) == 0
  new_number = number + number.reverse  
  reversibles_array << number if new_number.has_only_odd_digits?
end

puts    
puts "There are #{reversibles_array.length} reversibles below #{MAX_NUMBER}"
puts
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"

## Output from execution. It took 899 minutes!!!!!!!!
# There are 608720 reversibles below 1000000000
# 
# Time spent is 899.96737325  minutes