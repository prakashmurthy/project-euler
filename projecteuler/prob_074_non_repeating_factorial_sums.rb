#!/usr/bin/env ruby
# Solution to problem number 74 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=74
# projecteuler/prob_074_non_repeating_factorial_sums.rb

require "../lib/factorial"
start_time = Time.new
# puts 10.factorial
# puts 1454.factorials_sum

numbers_with_60_items = []
for start_number in 1..1_000_000
  puts "Now processing #{start_number}; Time spent is #{(Time.now - start_time) / 60 } minutes. Count is #{numbers_with_60_items.length}." if start_number.modulo(10_000) == 0
  factorials_sum_chain = []
  number = start_number
  factorials_sum_chain << number
  while true
    next_number = number.factorials_sum
    #puts "The next number is #{next_number}."
    break if factorials_sum_chain.include?(next_number)
    factorials_sum_chain << next_number
    number = next_number
  end
  #puts
  #puts "#{start_number} has the #{factorials_sum_chain.length} elements: #{factorials_sum_chain.join(', ')}"
  if (factorials_sum_chain.length == 60)
    puts "#{start_number} has 60 elements."
    numbers_with_60_items << start_number
  end
end
puts
puts "#{numbers_with_60_items.length} items have 60 elements." # "\n\nThey are:\n#{numbers_with_60_items.join(', ')}"
puts
puts "Time spent is #{(Time.now - start_time) / 60 } minutes."

# # Output from execution 
# 402 items have 60 elements.
# 
# Time spent is 22.2594436666667 minutes.