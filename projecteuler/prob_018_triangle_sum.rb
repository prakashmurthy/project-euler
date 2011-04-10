#!/usr/bin/env ruby
# Solution to problem number 18 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=18
input = []
File.open('./prob_018_input_triangle.txt', 'r') do |input_file|
  while line = input_file.gets
    input << line.split(' ').to_a
  end
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