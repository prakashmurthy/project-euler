#!/usr/bin/env ruby
# Solution to problem number 60 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=60

require 'prime'

class ConcatPrimes
  
  def ConcatPrimes.concat_prime?(prime1, prime2)
    first_number = (prime1.to_s + prime2.to_s).to_i
    second_number = (prime2.to_s + prime1.to_s).to_i
    Prime.prime?(first_number) and Prime.prime?(second_number)
  end
  
  def ConcatPrimes.concat_array_prime?(primes_array, new_prime)
    is_concat_prime = true
    primes_array.each do |prime_number|
      first_number = (prime_number.to_s + new_prime.to_s).to_i
      second_number = (new_prime.to_s + prime_number.to_s).to_i
      is_concat_prime = (Prime.prime?(first_number) and Prime.prime?(second_number))
      # puts "#{first_number} & #{second_number} evaluates to #{is_concat_prime}."
      break if is_concat_prime == false
    end
    is_concat_prime
  end
  
  def ConcatPrimes.special_primes(number)
    primes_array = []
    Prime.each do |new_prime|
      # puts "Beginning : #{new_prime}"
      temp_primes_array = Array.new(primes_array) # For looping while the original array could get modified with the new prime
      temp_primes_array.each do |prime_number_or_array|
        if prime_number_or_array.class == Array
          # It is an array of primes
          if ConcatPrimes.concat_array_prime?(prime_number_or_array, new_prime)
            # puts "Came here for #{prime_number_or_array.join(':')} and #{new_prime}."
            prime_number_or_array << new_prime
            primes_array << prime_number_or_array
            return prime_number_or_array if prime_number_or_array.length >= number
          end
        else
          # It is a single prime number
          # puts "The two primes are #{prime_number_or_array} and #{new_prime}"
          primes_array << [prime_number_or_array, new_prime] if ConcatPrimes.concat_prime?(prime_number_or_array, new_prime)
        end
      end
      primes_array << new_prime
    end
  end
end

if __FILE__ == $0
  start_time = Time.new
  required_number = 5
  result_array = ConcatPrimes.special_primes(required_number)
  puts "\n\n#{result_array.join(', ')} : First set of #{required_number} prime numbers with the required property. "
  puts "\n\n#{result_array.inject {|total, item| total + item}} is the sum of these primes."
  puts "\n\nFINISH!!! Time spent is #{(Time.now - start_time) / 60 } minutes\n"
end