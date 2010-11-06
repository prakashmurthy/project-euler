#!/usr/bin/env ruby
# Solution for Problem number 112 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=112

#projecteuler/prob_112_bouncy_numbers.rb

require "../lib/integer_functions"

start_time = Time.new

MAX_NUMBER = 1_000_000
count_of_non_bouncy_numbers = 0
number = 100
while number < MAX_NUMBER
  if !number.bouncy?
    count_of_non_bouncy_numbers += 1 
    #print "#{number}, "
  end
  puts "Now processing #{number} .Time spent is #{(Time.now - start_time) / 60 } minutes." if number.modulo(10_000_000) == 0
  number += 1
end
puts
puts "There are #{count_of_non_bouncy_numbers} non bouncy numbers below #{MAX_NUMBER}."
puts
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"
