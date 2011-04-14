#!/usr/bin/env ruby
# Solution to problem number 68 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=68

# max_value = 0
# (1..6).each do |a|
#   (1..6).each do |b|
#     next if (a >= b)
#     (1..6).each do |c|
#       next if (a >= c) || (b==c)
#       (1..6).each do |d|
#         next if (a==d) || (b==d) || (c==d)
#         (1..6).each do |e|
#           next if (a==e) || (b==e) || (c==e) || (d==e)
#           (1..6).each do |f|
#             next if (a==f) || (b==f) || (c==f) || (d==f) || (e==f)
#             # puts "#{a} #{b} #{c} #{d} #{e} #{f}"
#             if (a+d+e == b+e+f) && (a+d+e == c+f+d)
#               puts "#{a} #{d} #{e}; #{b} #{e} #{f}; #{c} #{f} #{d}" 
#               string_value = (a.to_s + d.to_s + e.to_s + b.to_s + e.to_s + f.to_s + c.to_s + f.to_s + d.to_s).to_i
#               max_value = string_value if max_value < string_value
#             end
#           end
#         end
#       end
#     end
#   end
# end
# puts "The max value of the magic 3-gon ring is #{max_value}\n\n"

max_value = 0
(1..10).each do |x1|
  # puts "#{x1}"
  (1..10).each do |x2|
    next if (x1 >= x2)
    # puts "#{x1} #{x2}"
    (1..10).each do |x3|
      next if (x1 >= x3) || (x2==x3) 
      # puts "#{x1} #{x2} #{x3}" 
      (1..10).each do |x4|
        next if (x1 >= x4) || (x2==x4) || (x3==x4)
        # puts "#{x1} #{x2} #{x3} #{x4}" 
        (1..10).each do |x5|
          next if (x1 >= x5) || (x2==x5) || (x3==x5) || (x4==x5)
          # puts "#{x1} #{x2} #{x3} #{x4} #{x5}" 
          (1..9).each do |x6|
            next if (x1==x6) || (x2==x6) || (x3==x6) || (x4==x6) || (x5==x6)
            # puts "#{x1} #{x2} #{x3} #{x4} #{x5} #{x6}"
            (1..9).each do |x7|
              next if (x1==x7) || (x2==x7) || (x2==x7) || (x3==x7) || (x4==x7) || (x5==x7) || (x6==x7)
              # puts "#{x1} #{x2} #{x3} #{x4} #{x5} #{x6} #{x7}"
              (1..9).each do |x8|
                next if (x1==x8) || (x2==x8) || (x3==x8) || (x4==x8) || (x5==x8) || (x6==x8) || (x7==x8)
                # puts "#{x1} #{x2} #{x3} #{x4} #{x5} #{x6} #{x7} #{x8}"
                (1..9).each do |x9|
                  next if (x1==x9) || (x2==x9) || (x3==x9) || (x4==x9) || (x5==x9) || (x6==x9) || (x7==x9) || (x8==x9)
                  # puts "#{x1} #{x2} #{x3} #{x4} #{x5} #{x6} #{x7} #{x8} #{x9}"
                  (1..9).each do |x10|
                    next if (x1==x10) || (x2==x10) || (x3==x10) || (x4==x10) || (x5==x10) || (x6==x10) || (x7==x10) ||  (x8==x10) || (x9==x10) 
                    # puts "#{x1} #{x2} #{x3} #{x4} #{x5} #{x6} #{x7} #{x8} #{x9} #{x10}"
                    if (x1+x7+x8==x2+x8+x9) && (x1+x7+x8==x3+x9+x10) && (x1+x7+x8==x4+x10+x6) && (x1+x7+x8==x5+x6+x7)
                      puts "#{x1} #{x7} #{x8}; #{x2} #{x8} #{x9}; #{x3} #{x9} #{x10}; #{x4} #{x10} #{x6}; #{x5} #{x6} #{x7}"
                      string_value = (x1.to_s + x7.to_s + x8.to_s + x2.to_s + x8.to_s + x9.to_s + x3.to_s + x9.to_s + x10.to_s + x4.to_s + x10.to_s + x6.to_s + x5.to_s + x6.to_s + x7.to_s).to_i
                      max_value = string_value if string_value > max_value
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
puts "The max 16 digit string for a magic 5-gon ring is #{max_value}."

#
# OUTPUT
#

# 2 5 9; 4 9 3; 6 3 7; 8 7 1; 10 1 5
# 2 9 5; 10 5 1; 8 1 7; 6 7 3; 4 3 9
# 6 3 5; 7 5 2; 8 2 4; 9 4 1; 10 1 3
# 6 5 3; 10 3 1; 9 1 4; 8 4 2; 7 2 5
# The max 16 digit string for a magic 5-gon ring is 6531031914842725.
# Program exited with code #0 after 13.51 seconds.