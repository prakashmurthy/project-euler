#!/usr/bin/env ruby
# Solution to problem number 100 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=100
# prob_100_blue_discs.rb

class BagOfDiscs
  # total = 23
  # (2..total).each do |blue_discs|
  #   prob_of_two_blue_discs = blue_discs * 1.0 / total * (blue_discs - 1.0) / (total - 1.0)
  #   puts "Probabilty of picking 2 blue discs in a box containing #{total} colored socks with #{blue_discs} blue discs: #{prob_of_two_blue_discs}"
  # end
  
  def BagOfDiscs.combination_with_half_probability( total=21 )
    blue_discs_number = Math.sqrt(total * (total + 1.0) / 2.0).to_i - 3
    # puts "blue_discs_number = #{blue_discs_number}"
    while true
      # puts "Total = #{total} : blue_discs_number = #{blue_discs_number} : #{blue_discs_number * 1.0 / total * ( blue_discs_number - 1.0 ) / ( total - 1.0 ) }"
      return blue_discs_number if blue_discs_number * 1.0 / total * ( blue_discs_number - 1.0 ) / ( total - 1 ) == 0.5
      blue_discs_number += 1
      break if blue_discs_number * 1.0 / total * ( blue_discs_number - 1.0 ) / ( total - 1 ) > 0.5
    end
    return false
  end
  
  def BagOfDiscs.next_combination_with_half_probability(number)
    while true
      break if BagOfDiscs.combination_with_half_probability(number)
      number += 1
    end
    # puts "Number is #{number}."
    BagOfDiscs.combination_with_half_probability(number)
  end
end

if __FILE__ == $0
  puts BagOfDiscs.next_combination_with_half_probability(10**12)
  
  # puts BagOfDiscs.combination_with_half_probability(1000000030324)
  # puts "The probability is #{707106802629.0 / 1000000030324 *  707106802628.0 / 1000000030323}"
  # (3..25).each do |number|
  #   puts "Number of discs = #{number} ; Number of Blue discs for 0.5 probability : #{BagOfDiscs.combination_with_half_probability(number)}"
  # end
  
end