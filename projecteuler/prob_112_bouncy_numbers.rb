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

MAX_NUMBER = 1_000
count_of_bouncy_numbers = 0
for number in (1..MAX_NUMBER)
  count_of_bouncy_numbers += 1 if number.bouncy?
end
puts "There are #{count_of_bouncy_numbers} bouncy numbers below #{MAX_NUMBER}; works out to a percentage of #{count_of_bouncy_numbers.to_f/MAX_NUMBER}"
puts
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"