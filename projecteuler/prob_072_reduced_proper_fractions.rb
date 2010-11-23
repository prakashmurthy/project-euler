#!/usr/bin/env ruby
# Solution to problem number 72 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=72
require 'prime'
require 'mathn'

start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"

MAX_NUMBER = 1e6
count = 0
(2..MAX_NUMBER).each do |denominator|
  if Prime.prime?(denominator)
    count += denominator -1
    next
  end
  (1...denominator).each do |numerator|
    count += 1 if ( numerator.gcd(denominator) == 1 )
  end
  puts "Denominator is #{denominator}; Time spent is #{(Time.now - start_time) / 60 }  minutes" if (denominator % 1_000).zero?
end
puts "\n\nThere are #{count} reduced proper fractions for d <= #{MAX_NUMBER} "
puts "\n\nTime spent is #{(Time.now - start_time) / 60 }  minutes"