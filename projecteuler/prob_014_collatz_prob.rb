#!/usr/bin/env ruby
# Solution to problem number 14 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=14

def length_of_sequence(number)
  number_array = []
  number_array << number
  while true
    if (number.modulo(2) == 0)
      number = number / 2
    else
      number = 3 * number + 1
    end
    number_array << number
    break if number <= 1
  end

  number_array.length
end

max_length = 0
max_num = 1

for num in (2..1000000)
  sequence_length = length_of_sequence(num)
  if sequence_length > max_length
    max_length = sequence_length
    max_num = num
  end
  puts "now processing #{num}" if num.modulo(1000) == 0
end
#puts "Sequence length for 13 is #{length_of_sequence(13)}"
puts "Max Sequence length is for #{max_num} with #{max_length}"