#!/usr/bin/env ruby
# Solution to problem number 22 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=22

require 'open-uri'
words_array = []
scrubbed_words_array = []
myfile = open("http://projecteuler.net/project/names.txt")
myfile.each do |line|
  words_array = line.split(",")
end
puts "There are #{words_array.length} first names in the http://projecteuler.net/project/names.txt file."

words_array.each {|word| scrubbed_words_array << word[1..(word.length-2)]}

class String
  def alphabetical_value
    (0..(self.length)).inject {|total, count| total + self[count-1] - 64 }
    # total = 0
    #      for i in (0..(self.length-1))
    #        total += self[i] - 64
    #      end
    #      total
  end
end


total = scrubbed_words_array.sort!.inject(0) { |result, element| result + element.alphabetical_value * (scrubbed_words_array.index(element) + 1) }
# Equivalent code without using inject method
# total = 0
# scrubbed_words_array.sort.each do |element|
#   total += element.alphabetical_value * (scrubbed_words_array.index(element) + 1)
#   #puts "element is #{element}; alphabetical value is #{element.alphabetical_value}; index value is #{scrubbed_words_array.index(element) + 1} Total is #{total}" 
# end

puts "Total of all the name scores in the file is #{total}"