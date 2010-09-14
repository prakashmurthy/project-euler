#!/usr/bin/env ruby
# Solution for Problem number 112 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=112

#projecteuler/prob_112_bouncy_numbers.rb

require "../lib/integer_functions"

start_time = Time.new

# puts 12345.bouncy?    # FALSE
# puts 563.bouncy?      # TRUE
# puts 823456.bouncy?   # TRUE
# puts 12345677.bouncy? # FALSE
# puts 12345607.bouncy? # TRUE
# puts 6621.bouncy?        # FALSE
# puts 101.bouncy?       # TRUE

MAX_NUMBER = 21_780 
REQ_PERCENTAGE = 99
count_of_bouncy_numbers = 0
number = 100
while true
  if number.bouncy?
    count_of_bouncy_numbers += 1 
    #print "#{number}, "
  end
  break if (count_of_bouncy_numbers.to_f/number)*100 == REQ_PERCENTAGE
  #break if number == MAX_NUMBER
  puts "Now processing #{number} .... Percentage is #{(count_of_bouncy_numbers.to_f/number)*100}." if number.modulo(10_000) == 0
  number += 1
end
puts
puts
#puts "the percentage at number = #{MAX_NUMBER} is #{(count_of_bouncy_numbers.to_f/number)*100}"
puts "The percentage of bouncy numbers is equal than #{REQ_PERCENTAGE} % when number = #{number}."
#puts "There are #{count_of_bouncy_numbers} bouncy numbers below #{MAX_NUMBER}; works out to a percentage of #{count_of_bouncy_numbers.to_f/MAX_NUMBER}"
puts
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"


# Output from execution; finishes in 19 seconds!!!!# 
# The percentage of bouncy numbers is equal than 99 % when number = 1587000.
# 
# Time spent is 0.319454416666667  minutes