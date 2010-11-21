#!/usr/bin/env ruby
# Solution to problem number 44 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=44

class Pentagonal
  
  def initialize(index)
    @value = index * ( 3 * index - 1) / 2 # n(3n1)/2
  end
  
  def value
    @value
  end
end

class Integer
  def pentagonal?
    number = (Math.sqrt(self) / 2).to_i
    while true
      pentagonal = Pentagonal.new(number)
      # puts "Number is #{self} : Pentagonal number is #{pentagonal.value}."
      return true if pentagonal.value == self
      break if pentagonal.value > self
      number += 1
    end
    false
  end
end

if __FILE__ == $0
  # (1..10).each do |number|
  #   pentagonal = Pentagonal.new(number)
  #   puts "The #{number}th pentagonal number is #{pentagonal.value}."
  # end
  # puts "\n\n"
  # (144..146).each { |number| puts "#{number} is pentagonal" if number.pentagonal? }
  start_time = Time.new
  number = 1
  penta_array = []
  unique_pair_found = false
  min_difference = 1_000_000_000_000 # Random large number
  while true
    pentagonal = Pentagonal.new(number)
    next_pentagonal = pentagonal.value
    penta_array.each do |pentagonal_number|
      if penta_array.include?(next_pentagonal - pentagonal_number)
        # puts "#{next_pentagonal} - #{pentagonal_number} is a pentagonal number."
        if (next_pentagonal + pentagonal_number).pentagonal?
          unique_pair_found = true
          min_difference = next_pentagonal - pentagonal_number if (min_difference > (next_pentagonal - pentagonal_number))
          puts "\n\n#{next_pentagonal} +/- #{pentagonal_number} is a pentagonal number."
        end
      end
    end
    penta_array << next_pentagonal
    puts "Number is #{number}. Pentagonal is #{next_pentagonal}. Time spent is #{(Time.now - start_time) / 60 } minutes" if (number % 100).zero?
    number += 1
    break if unique_pair_found and ( penta_array[-1] - penta_array[-2] > min_difference )
  end
  puts "\n\nThe min difference is #{min_difference}."
  puts "\n\nTime spent is #{(Time.now - start_time) / 60 } minutes"
end