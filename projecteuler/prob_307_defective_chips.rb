#!/usr/bin/env ruby
# Solution to problem number 307 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=307
# prob_307_defective_chips.rb

chips = 1_000_000
defects = 20_000

## Each of the defects has 1M options => Total = 1M**20k
total_combinations = chips**defects

## Combinations with only one defect per chip
total_1_defect_per_chip = 1
(1..defects).each do |count|
  total_1_defect_per_chip *= chips - count + 1
end

# puts "#{total_combinations > total_1_defect_per_chip}"
puts "Percentage of combinations with only one defect per chip = #{(total_1_defect_per_chip * 100.0  / total_combinations)}."

## Combinations with only two defect per chip
total_2_defect_per_chip = 1