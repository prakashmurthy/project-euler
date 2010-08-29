#!/usr/bin/env ruby
# Solution to problem number 16 at Project Euler
# Problem 16
# http://projecteuler.net/index.php?section=problems&id=16
#
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

total = 0
(2**1000).to_s.split(//).each do |num|
  total = total + num.to_i
end
puts "The sum of the digits of the number 2^1000 is #{total}"