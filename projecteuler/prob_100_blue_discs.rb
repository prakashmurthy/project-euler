#!/Users/prakashmurthy/.rvm/rubies/ruby-1.9.2-rc1/bin/ruby
# Solution to problem number 100 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=100
# prob_100_blue_discs.rb

class BagOfDiscs
  def BagOfDiscs.combination_with_half_probability(total=21)
    number_of_blue_discs = Math.sqrt(total * (total - 1.0) / 2.0).to_i - 3
    count = 0
    while true      
      probability_of_two_blue_discs = number_of_blue_discs * 1.0 * (number_of_blue_discs - 1.0 ) / total  / (total - 1.0)
      # puts "Total: #{total} No. of blue discs : #{number_of_blue_discs} Probability : #{probability_of_two_blue_discs}."
      break if number_of_blue_discs * (number_of_blue_discs - 1) * 2 == total * (total - 1)
      if count.zero? and probability_of_two_blue_discs > 0.5
        puts "\n\nSOMETHING WRONG HERE!! Total: #{total} No. of blue discs : #{number_of_blue_discs} Probability : #{probability_of_two_blue_discs}.\n\n"
      end
      count += 1
      number_of_blue_discs += 1
      return false if number_of_blue_discs * (number_of_blue_discs - 1) * 2 > total * (total - 1)
    end
    number_of_blue_discs
  end
  
  def BagOfDiscs.next_combination_with_half_probability(total)
    while true
      total += 1
	  # puts "Total = #{total}" if ( total % 1_000 ).zero?
      next if !BagOfDiscs.combination_with_half_probability(total)
      number_of_blue_discs = BagOfDiscs.combination_with_half_probability(total)
      break
    end
    puts "Total is #{total}"
    number_of_blue_discs
  end
end

if __FILE__ == $0
	puts "Your answer is : #{BagOfDiscs.combination_with_half_probability(1070379110497)}"
    # Refer to http://www.research.att.com/~njas/sequences/A046090 for how the above came about ;-)
end