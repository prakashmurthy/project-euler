#!/usr/bin/env ruby
# Solution to problem number 36 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=36
# projecteuler/prob_036_palindromic_numbers.rb

start_time = Time.new

require "../lib/integer_functions"

MAX_NUMBER = 1_000_000

decimal_palindromes = []
for number in (1..MAX_NUMBER)
  decimal_palindromes << number if number.palindrome?
  puts "Now processing #{number}...." if number.modulo(100_000) == 0
end

puts "There are #{decimal_palindromes.length} palindromic decimal numbers less than #{MAX_NUMBER}."
puts "The numbers are #{decimal_palindromes.join(", ")}"
puts

# for number in (1..37)
#   puts "Binary representation of #{number} is #{number.binary_representation}"
# end

count = 1
binary_palindromes = []
decimal_palindromes.each do |decimal_palindrome|
  binary_string = decimal_palindrome.binary_representation
  binary_palindromes << decimal_palindrome if (binary_string == binary_string.reverse)
  count += 1
  puts "Now processing #{count} item." if count.modulo(500) == 0
end

puts "There are #{binary_palindromes.length} numbers less than #{MAX_NUMBER} which are palindromic in base 10 and base 2."
puts "The numbers are #{binary_palindromes.join(", ")}"
puts
puts "The total of these numbers is #{binary_palindromes.inject {|result, element| result + element}}"
puts 
puts "Time spent is #{(Time.now - start_time) / 60 }  minutes"

## Last part of the output from execution
# There are 19 numbers less than 1000000 which are palindromic in base 10 and base 2.
# The numbers are 1, 3, 5, 7, 9, 33, 99, 313, 585, 717, 7447, 9009, 15351, 32223, 39993, 53235, 53835, 73737, 585585
# 
# The total of these numbers is 872187
# 
# Time spent is 0.0457686833333333  minutes