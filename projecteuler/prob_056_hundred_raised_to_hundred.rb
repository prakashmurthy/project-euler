#!/usr/bin/env ruby
# Solution to problem number 56 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=56

a = b = max_a = max_b = 1
max_length = 0

while a <= 100
  while b <= 100
    total = 0
    (a**b).to_s.split(//).each {|char| total = total + char.to_i }
    if total > max_length
      max_length = total
      max_a = a
      max_b = b
      puts "max values #{max_length} for a = #{max_a} and b = #{max_b}"
    end
    b += 1
  end
  a += 1
  b = 1
end
puts "Final values #{max_length} for a = #{max_a} and b = #{max_b}"