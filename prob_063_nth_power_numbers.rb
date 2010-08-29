#!/usr/bin/env ruby
# Solution to problem number 63 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=63

nth_power_count = 0
for x in (1..50)
  number = 1
  while true
    length = (number**x).to_s.split(//).length
    if length == x
        puts "number = #{number}; x = #{x}; power = #{number**x}; length =  #{length}" 
        nth_power_count = nth_power_count + 1
    end
    number = number + 1
    break if length > x
  end
  x = x + 1
end
puts "There are #{nth_power_count} nth_power type numbers."