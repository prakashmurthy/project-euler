#!/usr/bin/env ruby
# change_for_2pounds.rb
# Solution for problem 31 in Euler project
# http://projecteuler.net/index.php?section=problems&id=31

combination_number = 0
              
no_of_2_pounds    = 0
no_of_pounds      = 0
no_of_half_pounds = 0
no_of_20_pences   = 0
no_of_10_pences   = 0
no_of_5_pences    = 0
no_of_2_pences    = 0
no_of_pences      = 0

def total no_of_2_pounds, no_of_pounds, no_of_half_pounds, no_of_20_pences, no_of_10_pences, no_of_5_pences, no_of_2_pences, no_of_pences
 (no_of_2_pounds     * 200) + 
 (no_of_pounds       * 100) + 
 (no_of_half_pounds  *  50) + 
 (no_of_20_pences    *  20) + 
 (no_of_10_pences    *  10) + 
 (no_of_5_pences     *   5) +
 (no_of_2_pences     *   2) + 
 (no_of_pences       *   1)
end

#puts "Test total = #{total(0, 1, 0, 2, 4, 10)}"
while no_of_2_pounds              <= (200 / 200).to_i
  while no_of_pounds              <= (200 / 100).to_i
    while no_of_half_pounds       <= (200 /  50).to_i
      while no_of_20_pences       <= (200 /  20).to_i
        while no_of_10_pences     <= (200 /  10).to_i
          while no_of_5_pences    <= (200 /   5).to_i
            while no_of_2_pences  <= (200 /   2).to_i
              while no_of_pences  <= (200 /   1).to_i
                #puts "No of Pennies: #{no_of_pences} Total evaluates to: #{total(no_of_pounds, no_of_half_pounds, no_of_20_pences, no_of_10_pences, no_of_5_pences, no_of_pences)}"
                total_value = total(no_of_2_pounds, no_of_pounds, no_of_half_pounds, no_of_20_pences, no_of_10_pences, no_of_5_pences, no_of_2_pences, no_of_pences)
                if (total_value == 200)
                  combination_number += 1
                  puts "Combination # #{combination_number}: #{no_of_2_pounds} 2P + #{no_of_pounds} P + #{no_of_half_pounds} 50p + #{no_of_20_pences} 20p + #{no_of_10_pences} 10p + #{no_of_5_pences} 5p + #{no_of_2_pences} 2p + #{no_of_pences} p."
                elsif (total_value > 200)
                  break
                end
                no_of_pences = no_of_pences + 1
              end
              no_of_pences   = 0
              
              no_of_2_pences = no_of_2_pences + 1
            end
            no_of_2_pences    = 0
            no_of_pences      = 0
        
            no_of_5_pences = no_of_5_pences + 1
          end
          no_of_5_pences    = 0
          no_of_2_pences    = 0
          no_of_pences      = 0
        
          no_of_10_pences = no_of_10_pences + 1
        end
        no_of_10_pences   = 0
        no_of_5_pences    = 0
        no_of_2_pences    = 0
        no_of_pences      = 0
      
        no_of_20_pences = no_of_20_pences + 1
      end
      no_of_20_pences   = 0
      no_of_10_pences   = 0
      no_of_5_pences    = 0
      no_of_2_pences    = 0
      no_of_pences      = 0
    
      no_of_half_pounds = no_of_half_pounds + 1
    end
    no_of_half_pounds = 0
    no_of_20_pences   = 0
    no_of_10_pences   = 0
    no_of_5_pences    = 0
    no_of_2_pences    = 0
    no_of_pences      = 0
  
    no_of_pounds += 1
  end
  no_of_pounds      = 0
  no_of_half_pounds = 0
  no_of_20_pences   = 0
  no_of_10_pences   = 0
  no_of_5_pences    = 0
  no_of_2_pences    = 0
  no_of_pences      = 0

  no_of_2_pounds += 1  
end