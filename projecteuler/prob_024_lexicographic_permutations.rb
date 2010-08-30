#!/usr/bin/env ruby
# Solution to problem number 24 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=24

require "../lib/factorial"

required_string = ''
items_array = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

# first level breakdown of ordered permutations
# total_combinations = items_array.length.factorial
# puts "Total of the number of combinations is #{total_combinations}"
# 
# items_array.each {|item| puts "#{item} ends at #{total_combinations * (item.to_i+1) / 10}"}
REQUIRED_POS = 1_000_000
start_pos = 1
while true
  count = 0
  no_of_combinations_per_item = (items_array.length - 1).factorial
  while count < items_array.length
    item_n_start_pos = start_pos + no_of_combinations_per_item * count 
    item_n_end_pos = start_pos + no_of_combinations_per_item * (count + 1) - 1
    puts "Combinations starting with #{items_array[count]} begin at #{item_n_start_pos} and end at #{item_n_end_pos}"
    if (item_n_start_pos <= REQUIRED_POS) and (item_n_end_pos >= REQUIRED_POS)
      required_string += items_array.slice!(count)
      puts "Required string is #{required_string} and the remaining array is #{items_array.join(', ')}" 
      start_pos = item_n_start_pos
      break
    end
    count += 1
  end
  break if (start_pos == REQUIRED_POS)
end

puts "The one millionth combination is #{required_string + items_array.join}"