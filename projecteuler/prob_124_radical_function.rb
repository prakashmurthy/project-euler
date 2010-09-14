#!/usr/bin/env ruby
# Solution to problem number 124 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=124
# prob_124_radical_function.rb

require "../lib/array_functions"
@primes = []
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

def prime_factors(number)
  index = 0
  prime_factors = []
  while number > 1 
    while number.modulo(@primes[index]) == 0
      number /= @primes[index]
      prime_factors << @primes[index]
      # puts "Prime number is #{@primes[index]}; #{prime_factors.join(', ')}"
    end
    index += 1
  end
  prime_factors.uniq
end
    
def radical_function(number)
  return 1 if number == 1
  prime_factors_array = prime_factors(number)
  prime_factors_array.inject {|result, element| result * element}   
end 

start_time = Time.new
MAX_NUMBER = 100_000
primes_array(MAX_NUMBER)
puts "primes_array populated till #{MAX_NUMBER}"
puts 
# puts "There are #{@primes.length} primes numbers less than #{MAX_NUMBER}.\n\nPrime numbers are : #{@primes.join(', ')}"
# puts

# puts "64 has the following distinct prime factors: #{prime_factors(64).join(', ')};     rad(64) = #{radical_function(64)}."
# puts "1000 has the following distinct prime factors: #{prime_factors(1000).join(', ')}; rad(1000) = #{radical_function(1000)}."
# puts "504 has the following distinct prime factors: #{prime_factors(504).join(', ')};   rad(504) = #{radical_function(504)}."

rad_array = []
for number in 1..MAX_NUMBER
  rad_array << radical_function(number)
  puts "Number = #{number}; Time spent is #{(Time.now - start_time) / 60 } minutes." if (number % 10_000).zero?
end
puts "rad_array populated till #{MAX_NUMBER}.\n"
# rad_array.each_with_index {|number, index| puts "Rad(#{index + 1}) : #{number}"}
# puts
rad_array_sort_index = rad_array.sort_index
puts "rad_array_sort_index array created.\n"
# rad_array_sort_index.each_with_index {|number, index| puts "Index: #{index + 1} : #{number + 1}"}
# puts
# for index in 0..(rad_array_sort_index.length-1)
#   puts rad_array_sort_index[index]+1
# end
# puts 
# puts "E(4) = #{rad_array_sort_index[3]+1}"
# puts "E(6) = #{rad_array_sort_index[5]+1}"
puts "E(10_000) = #{rad_array_sort_index[(10_000-1)]+1}\n"
puts "Time spent is #{(Time.now - start_time) / 60 } minutes."

## Output from execution
# E(10_000) = 21417
# Time spent is 1.47772091666667 minutes.
