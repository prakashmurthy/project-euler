#!/usr/bin/env ruby
# Solution to problem 111 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=111
# prob_111_10_digit_primes.rb

require 'prime'
$start_time = Time.new

$primes_array = Array.new()

class Integer 
  def count_of_elements(digit)
    count_hash = Hash.new(0)
    self.to_s.split(//).each { |item| count_hash[item] += 1 }
    count_hash[digit.to_s]
  end
end

class Problem111
 
 def Problem111.fill_primes_array(number_of_digits)
   $primes_array = []
   (10**(number_of_digits-1)...10**number_of_digits).each do |big_number|
     puts "Now processing #{big_number}; Time spent is #{(Time.now - $start_time) / 60 } minutes" if ( big_number % 10_000).zero?
     $primes_array << big_number if Prime.prime?(big_number)
   end
 end
 
 def Problem111.m_function(number_of_digits, digit)
   
   max_repetition        = 0
   numbers_with_max_reps = []
   $primes_array.each do |prime_number|
     if !(prime_number.to_s =~ /#{digit}/).nil?
       count_of_digits = prime_number.count_of_elements(digit)
       numbers_with_max_reps << prime_number if count_of_digits == max_repetition
       if count_of_digits > max_repetition
         max_repetition = count_of_digits
         numbers_with_max_reps = []
         numbers_with_max_reps << prime_number
       end
     end
   end
   # puts "m_function(#{number_of_digits}, #{digit}) : The array is #{numbers_with_max_reps.join(', ')}"
   # numbers_with_max_reps.length
   [max_repetition, numbers_with_max_reps]
 end
 
 def Problem111.sum_of_s(number_of_digits)
   Problem111.fill_primes_array(number_of_digits)
   puts "\n\nCompleted filling Primes Array!!\n\n"
   total = 0
   (0..9).each do |number|
     puts "Processing number = #{number}. Time spent is #{(Time.now - $start_time) / 60 } minutes\n\n"
     total += Problem111.m_function(number_of_digits, number)[1].inject {|total, element| total + element}
   end
   total
 end
end

if __FILE__ == $0
  # Problem111.fill_primes_array(3)
  # puts $primes_array.join(', ')
  puts "The sum of all S(10, d) is #{Problem111.sum_of_s(10)}\n\n"
end

puts "Time spent is #{(Time.now - $start_time) / 60 }  minutes\n\n"