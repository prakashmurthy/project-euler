#!/usr/bin/env ruby
# Solution to problem number 95 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=95
# projecteuler/prob_095_amicable_chain.rb

require "../lib/integer_functions"

$start_time = Time.new
puts "Starting up 3... 2... 1... GOOOOOOOOOO!\n\n"
# Fill up sum of proper divisors hash till MAX_NUMBER
MAX_NUMBER = 1_000_000
$sum_of_proper_divs = MAX_NUMBER.sum_of_proper_divisors_hash
# $sum_of_proper_divs.sort.each do |key, value|
#   puts "#{key} has #{value} as sum of proper divisors."
# end

# number = 562
# divs_hash = number.proper_divisors_hash
# amicable_array = number.amicable_chain
# puts "#{number} has the amicable chain of length #{amicable_array.length} and consists of #{amicable_array.join(', ')}\n\n"

max_length_chain = 0
(2..(MAX_NUMBER-1)).each do |number| 
  amicable_array = number.amicable_chain
  if !amicable_array.empty?
    if amicable_array.length > max_length_chain
      max_length_chain = amicable_array.length
      puts "#{number} has the amicable chain of length #{amicable_array.length} and consists of #{amicable_array.join(', ')}\n\n"
    end
  end
  puts "MAIN: Now processing #{number}; Time spent is #{(Time.now - $start_time) / 60 } minutes\n" if ((number % (MAX_NUMBER/100)).zero? and (MAX_NUMBER > 10_000))
end
puts "FINISH!!! Time spent is #{(Time.now - $start_time) / 60 } minutes\n"