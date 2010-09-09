#!/usr/bin/env ruby
# Solution to problem number 92 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=92
# projecteuler/prob_092_number_chain.rb

start_time = Time.new

class Integer
  
  def next_number_in_chain
    next_number = 0
    for n in (1..(self.to_s.length))
      next_number += (self.to_s[n-1,1].to_i)**2
    end
    next_number
  end
  
end

MAX_NUMBER = 10_000_000

numbers_arriving_at_89 = 0
numbers_arriving_at_1 = 0

for number in 1..MAX_NUMBER
  current_number = number
  while true
    next_number = current_number.next_number_in_chain
    #puts "Next number after #{number} in the chain is #{next_number}"
    break if ((next_number == 89) or (next_number == 1))
    current_number = next_number
  end
  
  next_number == 89? numbers_arriving_at_89 += 1 : numbers_arriving_at_1 += 1
  puts "processing #{number} now." if number.modulo(10_000) == 0
end

puts "#{numbers_arriving_at_89} numbers less than #{MAX_NUMBER} arrive at 89."
puts "#{numbers_arriving_at_1} numbers less than #{MAX_NUMBER} arrive at 1."    

puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"

# Output from first run
# 8581146 numbers less than 10000000 arrive at 89.
# 1418854 numbers less than 10000000 arrive at 1.
# Time spent is 24.2751357333333  minutes