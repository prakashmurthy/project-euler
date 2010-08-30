#!/usr/bin/env ruby
# Solution to problem number 29 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=29

#########################################################################################
# My solution commented out ; 
# Tried to learn about benchmarking based on solutions provided on Project Euler Forums
#########################################################################################
# a = 2
# b = 2
# combinations_array = []
# 
# while a <= 100
#   while b <=100
#     combinations_array.push(a**b)
#     b = b + 1
#   end
#   a = a + 1
#   b = 2
# end
# 
# #combinations_array.uniq.each {|num| print "#{num},"}
# #puts
# puts combinations_array.uniq.length
require 'benchmark'
include Benchmark

def with_hash2(num)
  r = {}
 (2..num).each do |a|
   (2..num).each do |b|
     r[a**b] = 1
   end
 end
 puts r.size
end     

def with_array(n)
  ary = []
  for a in 2..n
    for b in 2..n
      ary << a**b
    end
  end
  ary.uniq.size
end
 
def with_hash(n)
  hash = {}
  for a in 2..n
    for b in 2..n
      hash[a**b] = 1
    end
  end
  puts hash.size
end
 
bm do |x|
  x.report("Hash:"){with_hash(600)}
  x.report("Hash2:"){with_hash2(600)}
  x.report("Array:"){with_array(600)}
end