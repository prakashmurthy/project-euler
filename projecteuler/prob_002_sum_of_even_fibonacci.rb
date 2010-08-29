#!/usr/bin/env ruby
# fibonacci.rb
# Solution to problem 2 in Project Euler
# http://projecteuler.net/index.php?section=problems&id=2

i = 0
j = 1
fibonacci = []

while true
  k = j
  j = i + j
  i = k
  if j < 4000000 
    fibonacci.push(j)
  else
    break
  end
end

#puts fibonacci

sum = 0
fibonacci.each  { |num| sum = sum + num if num.even? }

puts "The sum of even numbers in this series is #{sum}"