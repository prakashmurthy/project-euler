#!/usr/bin/env ruby
# Solution to problem number 21 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=21
require "../lib/integer_functions"

# puts proper_divisors(6)
# puts sum_of_proper_divisors(6)
# puts proper_divisors(28)
# puts sum_of_proper_divisors(28)

amicable_numbers_array = []
(2..10000).each do |num|
  sum = num.sum_of_proper_divisors
  if sum != num
    new_num = sum.sum_of_proper_divisors
    amicable_numbers_array.push(num) if num == new_num  
    puts "Now processing #{num}" if num.modulo(400) == 0
  end
end

total = 0
amicable_numbers_array.each do |num|
  puts num
  total = total + num
end
puts "The total of amicable numbers is #{total}"
  
