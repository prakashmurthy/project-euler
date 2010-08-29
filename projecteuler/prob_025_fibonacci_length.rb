#!/usr/bin/env ruby
# fibonacci_length.rb
# Solution to Problem number 25 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=25

i = 0
j = 1
fibonacci = []
fibonacci.push(j)

while true
  k = j
  j = i + j
  i = k

  fibonacci.push(j)
  break if j.to_s.length == 1000
end

puts "The number #{fibonacci.size} in Fibonacci sequence is #{fibonacci.pop}"
