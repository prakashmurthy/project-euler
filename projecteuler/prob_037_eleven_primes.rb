#!/usr/bin/env ruby
# Solution to problem number 37 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=37
# projecteuler/prob_037_eleven_primes.rb

start_time = Time.new

MAX_NUMBER = 1_000_000
def primes_array(max_number)
  @sieve = Array.new(max_number)
  for number in (2..Math.sqrt(max_number))
    next if @sieve[number]
    for inner_count in 2..(max_number/number)
      @sieve[inner_count * number] = true
    end
  end
end

def prime?(number)
  return false if ((number == 0) or (number == 1))
  @sieve[number].nil?
end

def truncatable_both_ways?(number)
  number_str = number.to_s
  number_length = number_str.length

  for count in (1..(number_length-1))
    right_to_left_truncated_number = (number_str[0, (number_length - count)]).to_i
    return false if !prime?(right_to_left_truncated_number)
    left_to_right_truncated_number = (number_str[(number_length - count), number_length]).to_i
    return false if !prime?(left_to_right_truncated_number)
    #puts "#{right_to_left_truncated_number}, #{left_to_right_truncated_number}"
  end
  true
end

primes_array(MAX_NUMBER) # The primes array is populated with primes < MAX_NUMBER
# for number in (2..1000)
#   print "#{number}, " if @sieve[number].nil?
# end
# puts
# puts
# puts "prime?(37) evaluates to #{prime?(37)}" #TRUE
# puts "prime?(237) evaluates to #{prime?(237)}" #FALSE
# puts "truncatable_both_ways?(123456) #{truncatable_both_ways?(123456)}" #FALSE
# puts "truncatable_both_ways?(3797) #{truncatable_both_ways?(3797)}" #TRUE
# puts "prime?(0) valuates to #{prime?(0)}" #FALSE
# puts "prime?(1) valuates to #{prime?(1)}" #FALSE
# puts "prime?(2) valuates to #{prime?(2)}" #TRUE

number = 10 # starting with double digit numbers
count_of_required_primes = 0
sum_of_required_primes = 0

while true
  number += 1
  #puts "Now processing #{number}" if number.modulo(100) == 0
  break if count_of_required_primes == 11
  next if !prime?(number)
  if truncatable_both_ways?(number)
    puts "#{number} is another winner!"
    count_of_required_primes += 1
    sum_of_required_primes += number
  end
end
puts "The sum of the required primes is #{sum_of_required_primes}"
puts
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"

## Output from execution
# 23 is another winner!
# 37 is another winner!
# 53 is another winner!
# 73 is another winner!
# 313 is another winner!
# 317 is another winner!
# 373 is another winner!
# 797 is another winner!
# 3137 is another winner!
# 3797 is another winner!
# 739397 is another winner!
# The sum of the required primes is 748317
# 
# Time spent is 0.0369792333333333  minutes