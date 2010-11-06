#!/usr/bin/env ruby
# Solution to problem number 72 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=72
require "prime"
start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"

MAX_NUMBER = 8
sum = (1...MAX_NUMBER).inject {|sum, denominator| sum + denominator}
puts "Total is #{sum}"
(2..MAX_NUMBER).each do |denominator|
  puts "Denominator = #{denominator}; subtract = #{MAX_NUMBER/denominator -1}"
  sum -= (MAX_NUMBER/denominator -1)
end
count = sum
puts "\n\nThere are #{count} reduced proper fractions for d <= #{MAX_NUMBER} "
puts "\n\nTime spent is #{(Time.now - start_time) / 60 }  minutes"