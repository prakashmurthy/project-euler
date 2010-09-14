#!/usr/bin/env ruby
# Solution for Problem number 57 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=57

# projecteuler/prob_057_sqrt2_expansion.rb
start_time = Time.new

MAX_EXPANSION_COUNT = 1_000
expansion_count = 1
current_num = 3
current_den = 2
special_count = 0
puts "First values are: Expansion count -  #{expansion_count} : #{current_num} / #{current_den}"
while true
  expansion_count += 1 
  next_den = current_num + current_den
  next_num = next_den + current_den
  #puts " next values are: Expansion count -  #{expansion_count} : #{next_num} / #{next_den}"
  if (next_num.to_s.length > next_den.to_s.length)
    puts " next values are: Expansion count -  #{expansion_count} : #{next_num} / #{next_den}"
    special_count += 1 
  end
  break if expansion_count == MAX_EXPANSION_COUNT
  current_num = next_num
  current_den = next_den
end
puts
puts "There are #{special_count} expansions where numerator has more digits than denominator, in the first #{MAX_EXPANSION_COUNT} expansions."
puts
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"

## Output from expansion
# There are 153 expansions where numerator has more digits than denominator, in the first 1000 expansions.
# 
# Time spent is 0.00336198333333333  minutes