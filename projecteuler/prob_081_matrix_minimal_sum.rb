#!/usr/bin/env ruby
# Solution to problem number 81 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=81
require 'open-uri'

#
# Test Input
# 
# input = [[131, 673, 234, 103, 18],
#         [201, 96, 342, 965, 150],
#         [630, 803, 746, 422, 111],
#         [537, 699, 497, 121, 956],
#         [805, 732, 524, 37, 331]]

input = []
input_file = open("http://projecteuler.net/project/matrix.txt")
input_file.each do |line|
  input << line.split(',').map {|num_str| num_str.to_i}
end
        
MAX_NUMBER = 10_000_000
number_of_lines = input.length
puts "There are #{number_of_lines} lines.\n\n"

0.upto(number_of_lines-1) do |row_number|
  0.upto(number_of_lines-1) do |column_number|
    next if (row_number == 0) && (column_number == 0)
    above_value = ( row_number == 0 ? MAX_NUMBER : input[row_number-1][column_number] )
    right_value = ( column_number == 0 ? MAX_NUMBER : input[row_number][column_number-1] )
    input[row_number][column_number] += ( (above_value > right_value) ? right_value : above_value )
  end
end
puts "The minimum sum is #{input[number_of_lines-1][number_of_lines-1]}"