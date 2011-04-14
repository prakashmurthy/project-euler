#!/usr/bin/env ruby
# Solution to problem number 81 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=81

require 'open-uri'
MAX_VALUE = 10e6
class Matrix  
  attr_accessor :input
  attr_reader   :number_of_lines
        
  def number_of_lines
    @number_of_lines = @input.length
  end

  def update_columns
    number_of_lines
    1.upto(@number_of_lines-1) do |column_number|
    # 1.upto(1) do |column_number|
      puts "Working on column number : #{column_number}"
      update_column_with_minimal_sum(column_number)
    end
  end
  
  def update_column_with_minimal_sum(column_number)
    minimal_sum_array = Array.new(@number_of_lines)
    0.upto(@number_of_lines-1) do |row_number|
      minimal_sum_array[row_number] = minimal_sum(row_number, column_number)
    end
    minimal_sum_array.each_with_index do |value, index|
      @input[index][column_number] = value
    end
    # spitout
  end
  
  def minimal_sum(row_num, column_num)
    min_sum = MAX_VALUE
    0.upto(@number_of_lines-1) do |row_number|
      if row_number == row_num
        min_sum = @input[row_num][column_num-1] if @input[row_num][column_num-1] < min_sum
        # puts "row_number = #{row_number}; row_num = #{row_num} ; min_sum = #{min_sum}"
      elsif row_number < row_num
        sum = 0
        (row_number..row_num).each do |row|
          sum += @input[row][column_num-1]
        end
        min_sum = sum if sum < min_sum
        # puts "row_number = #{row_number}; row_num = #{row_num} ; min_sum = #{min_sum}"
        
        sum = @input[row_number][column_num-1]
        (row_number...row_num).each do |row|
          sum += @input[row][column_num]
        end
        min_sum = sum if sum < min_sum
        # puts "row_number = #{row_number}; row_num = #{row_num} ; min_sum = #{min_sum}"
      else
        sum = 0
        (row_num..row_number).each do |row|
          sum += @input[row][column_num-1]
        end
        min_sum = sum if sum < min_sum
        # puts "row_number = #{row_number}; row_num = #{row_num} ; min_sum = #{min_sum}"
        
        sum = @input[row_number][column_num-1]
        ((row_num+1)..row_number).each do |row|
          sum += @input[row][column_num]
        end
        min_sum = sum if sum < min_sum
        # puts "row_number = #{row_number}; row_num = #{row_num} ; min_sum = #{min_sum}"
      end
    end
    
    # puts "The original value is #{@input[row_num][column_num]} ; Minimum sum is #{min_sum}"
    min_sum += @input[row_num][column_num]
    
  end
  
  def spitout
    0.upto(@number_of_lines-1) do |row_number|
      0.upto(@number_of_lines-1) do |column_number|
        print "#{@input[row_number][column_number]} "
      end
      puts "\n"
    end
    puts "\n\n"
  end
  
  def minimum_value
    min_value = MAX_VALUE
    0.upto(@number_of_lines-1) do |row_number|
      min_value = @input[row_number][@number_of_lines-1] if @input[row_number][@number_of_lines-1] < min_value
    end
    min_value
  end
end

if __FILE__ == $0
  matrix = Matrix.new()
  
  #
  # Test Input
  #
  # matrix.input = [[131, 673, 234, 103, 18],
  #         [201, 96, 342, 965, 150],
  #         [630, 803, 746, 422, 111],
  #         [537, 699, 497, 121, 956],
  #         [805, 732, 524, 37, 331]]

  input = []
  input_file = open("http://projecteuler.net/project/matrix.txt")
  input_file.each do |line|
    input << line.split(',').map {|num_str| num_str.to_i}
  end
  matrix.input = input
  
  puts "There are #{matrix.number_of_lines} lines in the input file.\n\n"
  matrix.update_columns
  # matrix.spitout
  puts "\n\nThe minimum value is #{matrix.minimum_value}\n\n"
end

#
# Output
#

# The minimum value is 260324
# 
# Program exited with code #0 after 33.71 seconds.