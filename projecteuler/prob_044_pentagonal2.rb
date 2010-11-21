# From the forum on Project Euler
# Faster than my solution!

class Integer
  def pent?
    ((1+Math.sqrt(1+24*self))/6)%1 == 0
  end
end
 
a = 1
while true
  pa = a*(3*a-1)/2
  (1..a).each do |b|
    pb = b*(3*b-1)/2
    if (pa+pb).pent? && (pa-pb).abs.pent?
      puts (pa-pb).abs
      exit
    end
  end
  a += 1
end