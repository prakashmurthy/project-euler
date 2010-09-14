#!/usr/bin/env ruby
# Solution to problem number 50 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=50
# projecteuler/prob_050_prime_sums.rb

start_time = Time.new
@primes = []
MAX_NUMBER = 1_000_000 # 1_000_000
def primes_array(max_number)
  @sieve = Array.new(max_number)
  for number in (2..Math.sqrt(max_number))
    next if @sieve[number]
    for inner_count in 2..(max_number/number)
      @sieve[inner_count * number] = true
    end
  end
  for number in (2..max_number)
    @primes << number if @sieve[number].nil?
  end
end

def prime?(number)
  return false if ((number == 0) or (number == 1))
  @sieve[number].nil?
end

primes_array(MAX_NUMBER)

max_chain_length = 1

start_index = -1
while start_index < @primes.length
  start_index += 1
  end_index = start_index + max_chain_length - 1
  next if end_index >= @primes.length
  primes_in_sum_array = []
  (start_index..end_index).each do |index|
    primes_in_sum_array << @primes[index]
  end
  sum_of_primes = primes_in_sum_array.inject {|result, element| result + element}
  #puts "sum_of_primes > MAX_NUMBER is #{sum_of_primes - MAX_NUMBER}.\n"
  break if sum_of_primes > MAX_NUMBER
  while (sum_of_primes < MAX_NUMBER)
    if primes_in_sum_array.length > max_chain_length
      if prime?(sum_of_primes)
        max_chain_length = primes_in_sum_array.length
        puts "The primes sum array for #{sum_of_primes} has #{primes_in_sum_array.length} elements starting at #{@primes[start_index]}.\n"
        puts "Time spent is #{(Time.now - start_time) / 60 } minutes.\n\n"
      end
    end
    next if end_index == @primes.length
    end_index += 1  
    primes_in_sum_array << @primes[end_index]
    sum_of_primes = primes_in_sum_array.inject {|result, element| result + element}
    
  end
  
  puts "Now processing #{start_index};Time spent is #{(Time.now - start_time) / 60 } minutes.\n\n" if (start_index % 10_000).zero?
end
puts "\nCOMPLETED!!!!!!!! Time spent is #{(Time.now - start_time) / 60 } minutes."

## Output from execution
# The primes sum array for 997651 has 543 elements starting at 7.
# Time spent is 0.731016766666667 minutes.
# 
# 
# COMPLETED!!!!!!!! Time spent is 0.731833133333333 minutes.