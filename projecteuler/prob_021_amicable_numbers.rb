#!/usr/bin/env ruby
# Solution to problem number 21 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=21

def proper_divisors(number)
  i = 1
  divisors_array = []
  
  while i < number
    #puts "Came here with i = #{i}"
    if number.modulo(i) == 0
      divisors_array.push(i)
    end
    
    if ((i >= (number/2)) and (i < number))
      i = number
    else
      i = i + 1
    end
  
  end
  divisors_array
end

def sum_of_proper_divisors(number)
  divisors = proper_divisors(number)
  total = 0
  divisors.each {|num| total = total + num}
  total
end 

# puts proper_divisors(6)
# puts sum_of_proper_divisors(6)
# puts proper_divisors(28)
# puts sum_of_proper_divisors(28)

amicable_numbers_array = []
(2..10000).each do |num|
  sum = sum_of_proper_divisors(num)
  if sum != num
    new_num = sum_of_proper_divisors(sum)
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
  
