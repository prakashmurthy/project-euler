#!/usr/bin/env ruby
# Solution to problem number 30 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=30

def fifth_power_of_digits(number)
  total = 0
  number.to_s.split(//).each do |num|
    total = total + (num.to_i)**5
  end
  total
end

fifth_power_numbers_total = 0 
(10..10000000).each do |num|
  fifth_power_numbers_total += num if num == fifth_power_of_digits(num)
end
puts "The sum of all numbers that can be written as the sum of fifth power of their digits is #{fifth_power_numbers_total}"