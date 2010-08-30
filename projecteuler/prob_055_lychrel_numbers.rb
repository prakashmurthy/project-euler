#!/usr/bin/env ruby
# Solution to problem number 55 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=55

def reverse_number(number)
  number.to_s.reverse.to_i
end

def is_sum_palindromic?(number)
  sum = number + reverse_number(number)
  reverse_sum = reverse_number(sum)
  #puts ("number - #{number}, sum - #{sum}, reverse_sum - #{reverse_sum} & return value - #{reverse_sum == sum}")
  reverse_sum == sum
end

lychrel_array = []
start_number = 11
while start_number < 10000
  lychrel_number = true
  number = start_number
  for i in 1..50
    if is_sum_palindromic?(number)
      #puts "came here for #{number}"
      lychrel_number = false
      break
    end
    number = number + reverse_number(number)
    i = i + 1
  end
  lychrel_array << start_number if lychrel_number
  start_number = start_number + 1
  puts "Now processing #{start_number}" if start_number.modulo(1000) == 0
end  

puts "There are #{lychrel_array.count} lychrel numbers."