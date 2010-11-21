# From the forum on Project Euler
# Faster than my solution!

# class Integer
#   def pent?
#     ((1+Math.sqrt(1+24*self))/6)%1 == 0
#   end
# end
#  
# a = 1
# while true
#   pa = a*(3*a-1)/2
#   (1..a).each do |b|
#     pb = b*(3*b-1)/2
#     if (pa+pb).pent? && (pa-pb).abs.pent?
#       puts (pa-pb).abs
#       exit
#     end
#   end
#   a += 1
# end

# def pent(n)
#   n*(3*n-1)/2
# end
#  
# def check(p)
#   n = (1+(1+24*p.abs)**0.5)/6
#   n.to_i == n
# end
#  
# 4.upto 15 do |i|
#   raise unless check(pent(i))
#   raise if check(pent(i)+1)
# end
#  
# i = 1
# continue_flag = true
# while continue_flag
#   i += 1
#   1.upto i-1 do |j|
#     if check(pent(i)+pent(j)) && check(pent(i)-pent(j))
#       puts "P#{i} and P#{j}: difference = #{pent(i)-pent(j)}"
#       continue_flag = false
#     end
#   end
# end

require 'set'
 
def pentag_pair(max)
  p = []
  1.upto(max) do |n|
    pentag = n * (3 * n - 1) / 2
    (pentag > max) ? break : p << pentag    
  end
  ps = Set.new(p)
  p.each {|i| p.each {|j| return (i - j).abs if ps.include?(i + j) && ps.include?((i - j).abs) }}
end
 
puts pentag_pair(1e7)