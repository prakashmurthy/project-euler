#!/usr/bin/env ruby
# Solution to problem number 39 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=39
# projecteuler/prob_039_right_angle_triangle.rb

start_time = Time.new

MAX_PERIMETER = 1_000

max_number_of_solutions = 0
number_with_max_solutions = 0

p = 3
while p <= MAX_PERIMETER
  right_angle_combinations = []
  
  b = 2
  while b < p 
    
    a = 1
    while a < b 
      right_angle_combinations << [a, b, (p - a - b)] if (a**2 + b**2 == (p - a - b)**2)
      a += 1
    end
    a = 1
    b += 1
  end
  
  if (right_angle_combinations.length > max_number_of_solutions)
    max_number_of_solutions =   right_angle_combinations.length
    number_with_max_solutions = p
    puts "The max number of solutions is #{max_number_of_solutions} for #{number_with_max_solutions}."
    puts "The various solutions with #{number_with_max_solutions} as perimeter are #{right_angle_combinations.join(",")}"
  end
  e = 1
  b = 2
  p += 1
  puts "processing #{p} now." if p.modulo(50) == 0
end
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"