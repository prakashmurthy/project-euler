#!/usr/bin/env ruby
# Solution to problem number 17 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=17

require "../lib/integer_functions.rb"

# 8.to_words
# 23.to_words
# 23.to_words("")
# 98.to_words
# 102.to_words
# puts 33.to_words
# puts 102.to_words 
# puts 102.to_words("")
# puts 100.to_words("")
# puts 1000.to_words("")
#puts 1840.to_words("")
# puts 1002.to_words

number_of_letters = 0
for number in (1..1000)
  #puts number.to_words("")
  number_of_letters += number.to_words("").to_s.length
end
puts "#{number_of_letters} letters are required to write 1 to 1000 in words."
