#!/usr/bin/env ruby
# Solution to problem number 40 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=40

def print_number(number, number_string_length, required_length)
  puts "#{number}, #{number_string_length}, #{required_length}"
  number.to_s[number.to_s.length - (number_string_length.modulo(required_length) + 1), 1]
end

number = 1
number_string_length  = 0
found_1 = found_10 = found_100 = found_1_000 = found_10_000 = found_100_000 = found_1_000_000 = false


number_string = ""
while number <= 11000000
  break if found_1 and found_10 and found_100 and found_1_000 and found_10_000 and found_100_000 and found_1_000_000
  number_string_length = number_string_length + number.to_s.length
  #number_string = number_string + number.to_s
  
  if number_string_length > 10 and !found_10
    digit_10 = print_number(number, number_string_length, 10).to_i
    found_10 = true
  end
  
  if number_string_length > 100 and !found_100
    digit_100 = print_number(number, number_string_length, 100).to_i
    found_100 = true
  end
  
  if number_string_length > 1_000 and !found_1_000
    digit_1_000 = print_number(number, number_string_length, 1000).to_i
    found_1_000 = true
  end
  
  if number_string_length > 10_000 and !found_10_000
    digit_10_000 = print_number(number, number_string_length, 10_000).to_i
    found_10_000 = true
  end
  
  if number_string_length > 100_000 and !found_100_000
    digit_100_000 = print_number(number, number_string_length, 100_000).to_i
    found_100_000 = true
  end
  
  if number_string_length > 1_000_000 and !found_1_000_000
    digit_1_000_000 = print_number(number, number_string_length, 1_000_000).to_i
    found_1_000_000 = true
  end
  
  number += 1
  puts "Going through #{number} iteration." if number.modulo(1000000) == 0
end

puts
puts "The required answer is #{digit_10 * digit_100 * digit_1_000 * digit_10_000 * digit_100_000 * digit_1_000_000 }"
#puts "#{number_string_length}"
# puts "#{number_string[9,1]}"
# puts "#{number_string[99,1]}"
# puts "#{number_string[999,1]}"
# puts "#{number_string[9999,1]}"
#puts "#{number_string[99999,1]}"
