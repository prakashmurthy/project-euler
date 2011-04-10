#!/usr/bin/env ruby
# Solution to problem number 67 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=67
require 'open-uri'

input = []
input_file = open("http://projecteuler.net/project/triangle.txt")
input_file.each do |line|
  input << line.split(' ').to_a
end

number_of_lines = input.length
puts "There are #{number_of_lines} lines in the input file."

last_line = input.last 
number_of_lines.downto(2) do |line_number|
  penultimate_line = input[line_number - 2]
  
  sum_line = []
  penultimate_line.each_with_index do |number, index|
    sum_line[index] = number.to_i + (last_line[index].to_i > last_line[index+1].to_i ? last_line[index].to_i : last_line[index + 1].to_i)
  end
  last_line = sum_line
end
puts "The sum is #{last_line.join(', ')}"