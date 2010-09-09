#!/usr/bin/env ruby
# Solution to problem number 42 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=42

require 'open-uri'
words_array = []
scrubbed_words_array = []
words_with_values = []


class String
  
  def word_value()
    value = 0
    for i in 1..self.length
      #puts "value of #{self[i-1, 1]} is #{self[i-1, 1].unpack('c').to_s.to_i - 64}"
      value += self[i-1, 1].unpack('c').to_s.to_i - 64
    end
    value
  end
end

myfile = open("http://projecteuler.net/project/words.txt")
myfile.each do |line|
  words_array = line.split(",")
end
puts "There are #{words_array.length} words in the http://projecteuler.net/project/words.txt file."

words_array.each {|word| scrubbed_words_array << word[1..(word.length-2)]}

max_word_value = 0
max_word = ""
scrubbed_words_array.each do |word| 
  value = word.word_value
  if max_word_value < value
    max_word_value = value 
    max_word = word
  end
  words_with_values << [word, value]
end

puts "#{max_word} has the max word value of #{max_word_value}"
# puts "ABCDEXYZ".word_value
# puts "SKY".word_value

triangle_numbers_array = []
count = 1
while true
  next_triangle_number = ((1/2.0) * count * (count + 1)).to_i
  triangle_numbers_array << next_triangle_number
  count += 1
  break if next_triangle_number > max_word_value
end

puts "The triangle numbers are #{triangle_numbers_array.join(", ")}"
  
number_of_triangle_words = 0
words_with_values.each do |word, value|
  if triangle_numbers_array.include?(value)
    puts "#{word} is trianglular with value of #{value}"
    number_of_triangle_words += 1
  end
end

puts "There are #{number_of_triangle_words} Triangle words in the file."