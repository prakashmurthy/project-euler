#!/usr/bin/env ruby
# Solution for Problem number 20 in Project Euler 
# http://projecteuler.net/index.php?section=problems&id=20

class Integer
  def factorial 
    if self <= 1
      1
    else 
      self * ( self -1 ).factorial
    end
  end
end

hundred_factorial = 100.factorial
total = 0
hundred_factorial.to_s.split(//).each do |num|
  total = total + num.to_i
end
puts "Factorial of 100 is #{hundred_factorial}, and the sum of digits is #{total}"