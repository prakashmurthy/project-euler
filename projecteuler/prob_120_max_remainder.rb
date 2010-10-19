#!/usr/bin/env ruby
# Solution to problem number 72 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=72
# require 'mathn'
# require 'prime'

require "../lib/integer_functions.rb"
 
start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"

a = 3
sum_max_r = 0
while a <= 1_000
  n = 1
  r = 0
  max_r = 0
  while true 
    r = ((a-1)**n + (a+1)**n) % (a**2)
    max_r = r if r > max_r
    # puts "a = #{a}; n = #{n} r = #{r}"
    n += 1
    break if n > 2 * a
  end 
  sum_max_r += max_r
  a += 1
  puts "Processing a = #{a}. Time spent is #{(Time.now - start_time) / 60 } minutes" if (a % 100).zero?
end
puts "\n\n Sum of max remainders is #{sum_max_r}."
puts "\n\nTime spent is #{(Time.now - start_time) / 60 } minutes"

# Output from execution
# Sum of max remainders is 333082500.
#  
# Time spent is 1.7858516333333334 minutes