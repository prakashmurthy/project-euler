#!/usr/bin/env ruby
# Solution to problem number 15 on Project Euler
# http://projecteuler.net/index.php?section=problems&id=15
require "../lib/factorial"

# Work on a 2 by 2 matrix
# x = 0
# y = 0
# 
# while x <= 2
#   while y <= 2
#     puts "x = #{x}; y = #{y}"
#     y += 1
#   end
#   y = 0
#   x += 1
# end
# from (0,0) to (n,n) where n = 2
# (0,0), (0,1) (0,2) (1,2) (2,2)
# 
# (0,0) -> (0,1) -> (0,2) -> (1,2) -> (2,2)
#                -> (1,1) -> (1,2) -> (2,2)
#                         -> (2,1) -> (2,2)
#                         
#       -> (1,0) -> (2,0) -> (2,1) -> (2,2)
#                -> (1,1) -> (1,2) -> (2,2)
#                         -> (2,1) -> (2,2)

# puts 20.factorial
# puts 2.factorial
# puts 3.factorial

# 3 * 3 matrix
# a_array = ['1a']
# b_array = ['1b', '2b']
# c_array = ['1c', '2c', '3c']
# d_array = ['1d', '2d']
# e_array = ['1e']
# 
# a_count = b_count = c_count = d_count = e_count = 0
# 
# count = 1
# 
# while a_count < a_array.length
#   while b_count < b_array.length
#     while c_count < c_array.length
#       while d_count < d_array.length  
#         while e_count < e_array.length
#           puts "Combination #{count} is [#{a_array[a_count]}, #{b_array[b_count]}, #{c_array[c_count]}, #{d_array[d_count]}, #{e_array[e_count]}]"
#           e_count += 1
#           count += 1
#         end
#         e_count = 0
#         d_count += 1
#       end
#       d_count = e_count = 0
#       c_count += 1
#     end
#     c_count = d_count = e_count = 0
#     b_count += 1
#   end
#   b_count = c_count = d_count = e_count = 0
#   a_count += 1
# end

# Combination 1 is [1a, 1b, 1c, 1d, 1e] - valid
# Combination 3 is [1a, 1b, 2c, 1d, 1e] - valid
# Combination 4 is [1a, 1b, 2c, 2d, 1e] - valid
# Combination 9 is [1a, 2b, 2c, 1d, 1e] - valid
# Combination 10 is [1a, 2b, 2c, 2d, 1e] - valid
# Combination 12 is [1a, 2b, 3c, 2d, 1e] - valid
#  
# Combination 2 is [1a, 1b, 1c, 2d, 1e] - invalid
# Combination 5 is [1a, 1b, 3c, 1d, 1e] - invalid
# Combination 6 is [1a, 1b, 3c, 2d, 1e] - invalid
# 
# Combination 7 is [1a, 2b, 1c, 1d, 1e] - invalid
# Combination 8 is [1a, 2b, 1c, 2d, 1e] - invalid
# Combination 11 is [1a, 2b, 3c, 1d, 1e] - invalid

# a_array = ['1a']
# b_array = ['1b', '2b']
# c_array = ['1c', '2c', '3c']
# d_array = ['1d', '2d', '3d', '4d']
# e_array = ['1e', '2e', '3e']
# f_array = ['1f', '2f']
# g_array = ['1g']
# 
# a_count = b_count = c_count = d_count = e_count = f_count = g_count = 0
# 
# count = 1
# 
# while a_count < a_array.length
#   while b_count < b_array.length
#     while c_count < c_array.length
#       while d_count < d_array.length  
#         while e_count < e_array.length
#           while f_count < f_array.length
#             while g_count < g_array.length
#               puts "Combination #{count} is [#{a_array[a_count]}, #{b_array[b_count]}, #{c_array[c_count]}, #{d_array[d_count]}, #{e_array[e_count]}, #{f_array[f_count]}, #{g_array[g_count]}]"
#               g_count += 1
#               count += 1
#             end
#             g_count = 0
#             f_count += 1
#           end
#           f_count = g_count = 0
#           e_count += 1
#         end
#         e_count = f_count = g_count = 0
#         d_count += 1
#       end
#       d_count = e_count = f_count = g_count = 0
#       c_count += 1
#     end
#     c_count = d_count = e_count = f_count = g_count = 0
#     b_count += 1
#   end
#   b_count = c_count = d_count = e_count = f_count = g_count = 0
#   a_count += 1
# end
# 
# Combination 1 is [1a, 1b, 1c, 1d, 1e, 1f, 1g] - valid
# Combination 2 is [1a, 1b, 1c, 1d, 1e, 2f, 1g] - invalid
# Combination 3 is [1a, 1b, 1c, 1d, 2e, 1f, 1g] - invalid
# Combination 4 is [1a, 1b, 1c, 1d, 2e, 2f, 1g] - invalid
# Combination 5 is [1a, 1b, 1c, 1d, 3e, 1f, 1g] - invalid
# Combination 6 is [1a, 1b, 1c, 1d, 3e, 2f, 1g] - invalid
# 
# Combination 7 is [1a, 1b, 1c, 2d, 1e, 1f, 1g] - valid
# Combination 8 is [1a, 1b, 1c, 2d, 1e, 2f, 1g] - invalid
# Combination 9 is [1a, 1b, 1c, 2d, 2e, 1f, 1g] - valid
# Combination 10 is [1a, 1b, 1c, 2d, 2e, 2f, 1g] - valid
# Combination 11 is [1a, 1b, 1c, 2d, 3e, 1f, 1g] - invalid
# Combination 12 is [1a, 1b, 1c, 2d, 3e, 2f, 1g] - invalid
# 
# Combination 13 is [1a, 1b, 1c, 3d, 1e, 1f, 1g] - invalid
# Combination 14 is [1a, 1b, 1c, 3d, 1e, 2f, 1g] - invalid
# Combination 15 is [1a, 1b, 1c, 3d, 2e, 1f, 1g] - invalid
# Combination 16 is [1a, 1b, 1c, 3d, 2e, 2f, 1g] - invalid
# Combination 17 is [1a, 1b, 1c, 3d, 3e, 1f, 1g] - invalid
# Combination 18 is [1a, 1b, 1c, 3d, 3e, 2f, 1g] - invalid
# 
# Combination 19 is [1a, 1b, 1c, 4d, 1e, 1f, 1g] - invalid
# Combination 20 is [1a, 1b, 1c, 4d, 1e, 2f, 1g] - invalid
# Combination 21 is [1a, 1b, 1c, 4d, 2e, 1f, 1g] - invalid
# Combination 22 is [1a, 1b, 1c, 4d, 2e, 2f, 1g] - invalid
# Combination 23 is [1a, 1b, 1c, 4d, 3e, 1f, 1g] - invalid
# Combination 24 is [1a, 1b, 1c, 4d, 3e, 2f, 1g] - invalid
# 
# Combination 25 is [1a, 1b, 2c, 1d, 1e, 1f, 1g] - invalid
# Combination 26 is [1a, 1b, 2c, 1d, 1e, 2f, 1g] - invalid
# Combination 27 is [1a, 1b, 2c, 1d, 2e, 1f, 1g] - invalid
# Combination 28 is [1a, 1b, 2c, 1d, 2e, 2f, 1g] - invalid
# Combination 29 is [1a, 1b, 2c, 1d, 3e, 1f, 1g] - invalid
# Combination 30 is [1a, 1b, 2c, 1d, 3e, 2f, 1g] - invalid
# 
# Combination 31 is [1a, 1b, 2c, 2d, 1e, 1f, 1g] - valid
# Combination 32 is [1a, 1b, 2c, 2d, 1e, 2f, 1g] - invalid
# Combination 33 is [1a, 1b, 2c, 2d, 2e, 1f, 1g] - valid
# Combination 34 is [1a, 1b, 2c, 2d, 2e, 2f, 1g] - valid
# Combination 35 is [1a, 1b, 2c, 2d, 3e, 1f, 1g] - invalid
# Combination 36 is [1a, 1b, 2c, 2d, 3e, 2f, 1g] - invalid
# 
# Combination 37 is [1a, 1b, 2c, 3d, 1e, 1f, 1g] - invalid
# Combination 38 is [1a, 1b, 2c, 3d, 1e, 2f, 1g] - invalid
# Combination 39 is [1a, 1b, 2c, 3d, 2e, 1f, 1g] - valid
# Combination 40 is [1a, 1b, 2c, 3d, 2e, 2f, 1g] - valid
# Combination 41 is [1a, 1b, 2c, 3d, 3e, 1f, 1g] - invalid
# Combination 42 is [1a, 1b, 2c, 3d, 3e, 2f, 1g] - valid
# 
# Combination 43 is [1a, 1b, 2c, 4d, 1e, 1f, 1g] - invalid
# Combination 44 is [1a, 1b, 2c, 4d, 1e, 2f, 1g] - invalid
# Combination 45 is [1a, 1b, 2c, 4d, 2e, 1f, 1g] - invalid
# Combination 46 is [1a, 1b, 2c, 4d, 2e, 2f, 1g] - invalid
# Combination 47 is [1a, 1b, 2c, 4d, 3e, 1f, 1g] - invalid
# Combination 48 is [1a, 1b, 2c, 4d, 3e, 2f, 1g] - invalid
# 
# Combination 49 is [1a, 1b, 3c, 1d, 1e, 1f, 1g] - invalid
# Combination 50 is [1a, 1b, 3c, 1d, 1e, 2f, 1g] - invalid
# Combination 51 is [1a, 1b, 3c, 1d, 2e, 1f, 1g] - invalid
# Combination 52 is [1a, 1b, 3c, 1d, 2e, 2f, 1g] - invalid
# Combination 53 is [1a, 1b, 3c, 1d, 3e, 1f, 1g] - invalid
# Combination 54 is [1a, 1b, 3c, 1d, 3e, 2f, 1g] - invalid
# 
# Combination 55 is [1a, 1b, 3c, 2d, 1e, 1f, 1g] - invalid
# Combination 56 is [1a, 1b, 3c, 2d, 1e, 2f, 1g] - invalid
# Combination 57 is [1a, 1b, 3c, 2d, 2e, 1f, 1g] - invalid
# Combination 58 is [1a, 1b, 3c, 2d, 2e, 2f, 1g] - invalid
# Combination 59 is [1a, 1b, 3c, 2d, 3e, 1f, 1g] - invalid
# Combination 60 is [1a, 1b, 3c, 2d, 3e, 2f, 1g] - invalid
# 
# Combination 61 is [1a, 1b, 3c, 3d, 1e, 1f, 1g] - invalid
# Combination 62 is [1a, 1b, 3c, 3d, 1e, 2f, 1g] - invalid
# Combination 63 is [1a, 1b, 3c, 3d, 2e, 1f, 1g] - invalid
# Combination 64 is [1a, 1b, 3c, 3d, 2e, 2f, 1g] - invalid
# Combination 65 is [1a, 1b, 3c, 3d, 3e, 1f, 1g] - invalid
# Combination 66 is [1a, 1b, 3c, 3d, 3e, 2f, 1g] - invalid
# 
# Combination 67 is [1a, 1b, 3c, 4d, 1e, 1f, 1g] - invalid
# Combination 68 is [1a, 1b, 3c, 4d, 1e, 2f, 1g] - invalid
# Combination 69 is [1a, 1b, 3c, 4d, 2e, 1f, 1g] - invalid
# Combination 70 is [1a, 1b, 3c, 4d, 2e, 2f, 1g] - invalid
# Combination 71 is [1a, 1b, 3c, 4d, 3e, 1f, 1g] - invalid
# Combination 72 is [1a, 1b, 3c, 4d, 3e, 2f, 1g] - invalid
# 
# Combination 73 is [1a, 2b, 1c, 1d, 1e, 1f, 1g] - invalid
# Combination 74 is [1a, 2b, 1c, 1d, 1e, 2f, 1g] - invalid
# Combination 75 is [1a, 2b, 1c, 1d, 2e, 1f, 1g] - invalid
# Combination 76 is [1a, 2b, 1c, 1d, 2e, 2f, 1g] - invalid
# Combination 77 is [1a, 2b, 1c, 1d, 3e, 1f, 1g] - invalid
# Combination 78 is [1a, 2b, 1c, 1d, 3e, 2f, 1g] - invalid
# 
# Combination 79 is [1a, 2b, 1c, 2d, 1e, 1f, 1g] - invalid
# Combination 80 is [1a, 2b, 1c, 2d, 1e, 2f, 1g] - invalid
# Combination 81 is [1a, 2b, 1c, 2d, 2e, 1f, 1g] - invalid
# Combination 82 is [1a, 2b, 1c, 2d, 2e, 2f, 1g] - invalid
# Combination 83 is [1a, 2b, 1c, 2d, 3e, 1f, 1g] - invalid
# Combination 84 is [1a, 2b, 1c, 2d, 3e, 2f, 1g] - invalid
# 
# Combination 85 is [1a, 2b, 1c, 3d, 1e, 1f, 1g] - invalid
# Combination 86 is [1a, 2b, 1c, 3d, 1e, 2f, 1g] - invalid
# Combination 87 is [1a, 2b, 1c, 3d, 2e, 1f, 1g] - invalid
# Combination 88 is [1a, 2b, 1c, 3d, 2e, 2f, 1g] - invalid
# Combination 89 is [1a, 2b, 1c, 3d, 3e, 1f, 1g] - invalid
# Combination 90 is [1a, 2b, 1c, 3d, 3e, 2f, 1g] - invalid
# 
# Combination 91 is [1a, 2b, 1c, 4d, 1e, 1f, 1g] - invalid
# Combination 92 is [1a, 2b, 1c, 4d, 1e, 2f, 1g] - invalid
# Combination 93 is [1a, 2b, 1c, 4d, 2e, 1f, 1g] - invalid
# Combination 94 is [1a, 2b, 1c, 4d, 2e, 2f, 1g] - invalid
# Combination 95 is [1a, 2b, 1c, 4d, 3e, 1f, 1g] - invalid
# Combination 96 is [1a, 2b, 1c, 4d, 3e, 2f, 1g] - invalid
# 
# Combination 97 is [1a, 2b, 2c, 1d, 1e, 1f, 1g] - invalid
# Combination 98 is [1a, 2b, 2c, 1d, 1e, 2f, 1g] - invalid
# Combination 99 is [1a, 2b, 2c, 1d, 2e, 1f, 1g] - invalid
# Combination 100 is [1a, 2b, 2c, 1d, 2e, 2f, 1g] - invalid
# Combination 101 is [1a, 2b, 2c, 1d, 3e, 1f, 1g] - invalid
# Combination 102 is [1a, 2b, 2c, 1d, 3e, 2f, 1g] - invalid
# 
# Combination 103 is [1a, 2b, 2c, 2d, 1e, 1f, 1g] - valid
# Combination 104 is [1a, 2b, 2c, 2d, 1e, 2f, 1g] - invalid
# Combination 105 is [1a, 2b, 2c, 2d, 2e, 1f, 1g] - valid
# Combination 106 is [1a, 2b, 2c, 2d, 2e, 2f, 1g] - valid
# Combination 107 is [1a, 2b, 2c, 2d, 3e, 1f, 1g] - invalid
# Combination 108 is [1a, 2b, 2c, 2d, 3e, 2f, 1g] - invalid
# 
# Combination 109 is [1a, 2b, 2c, 3d, 1e, 1f, 1g] - invalid
# Combination 110 is [1a, 2b, 2c, 3d, 1e, 2f, 1g] - invalid
# Combination 111 is [1a, 2b, 2c, 3d, 2e, 1f, 1g] - valid
# Combination 112 is [1a, 2b, 2c, 3d, 2e, 2f, 1g] - valid
# Combination 113 is [1a, 2b, 2c, 3d, 3e, 1f, 1g] - invalid
# Combination 114 is [1a, 2b, 2c, 3d, 3e, 2f, 1g] - valid
# 
# Combination 115 is [1a, 2b, 2c, 4d, 1e, 1f, 1g] - invalid
# Combination 116 is [1a, 2b, 2c, 4d, 1e, 2f, 1g] - invalid
# Combination 117 is [1a, 2b, 2c, 4d, 2e, 1f, 1g] - invalid
# Combination 118 is [1a, 2b, 2c, 4d, 2e, 2f, 1g] - invalid
# Combination 119 is [1a, 2b, 2c, 4d, 3e, 1f, 1g] - invalid
# Combination 120 is [1a, 2b, 2c, 4d, 3e, 2f, 1g] - invalid
# 
# Combination 121 is [1a, 2b, 3c, 1d, 1e, 1f, 1g] - invalid
# Combination 122 is [1a, 2b, 3c, 1d, 1e, 2f, 1g] - invalid
# Combination 123 is [1a, 2b, 3c, 1d, 2e, 1f, 1g] - invalid
# Combination 124 is [1a, 2b, 3c, 1d, 2e, 2f, 1g] - invalid
# Combination 125 is [1a, 2b, 3c, 1d, 3e, 1f, 1g] - invalid
# Combination 126 is [1a, 2b, 3c, 1d, 3e, 2f, 1g] - invalid
# 
# Combination 127 is [1a, 2b, 3c, 2d, 1e, 1f, 1g] - invalid
# Combination 128 is [1a, 2b, 3c, 2d, 1e, 2f, 1g] - invalid
# Combination 129 is [1a, 2b, 3c, 2d, 2e, 1f, 1g] - invalid
# Combination 130 is [1a, 2b, 3c, 2d, 2e, 2f, 1g] - invalid
# Combination 131 is [1a, 2b, 3c, 2d, 3e, 1f, 1g] - invalid
# Combination 132 is [1a, 2b, 3c, 2d, 3e, 2f, 1g] - invalid
# 
# Combination 133 is [1a, 2b, 3c, 3d, 1e, 1f, 1g] - invalid
# Combination 134 is [1a, 2b, 3c, 3d, 1e, 2f, 1g] - invalid
# Combination 135 is [1a, 2b, 3c, 3d, 2e, 1f, 1g] - valid
# Combination 136 is [1a, 2b, 3c, 3d, 2e, 2f, 1g] - valid
# Combination 137 is [1a, 2b, 3c, 3d, 3e, 1f, 1g] - invalid
# Combination 138 is [1a, 2b, 3c, 3d, 3e, 2f, 1g] - valid
# 
# Combination 139 is [1a, 2b, 3c, 4d, 1e, 1f, 1g] - invalid
# Combination 140 is [1a, 2b, 3c, 4d, 1e, 2f, 1g] - invalid
# Combination 141 is [1a, 2b, 3c, 4d, 2e, 1f, 1g] - invalid
# Combination 142 is [1a, 2b, 3c, 4d, 2e, 2f, 1g] - invalid
# Combination 143 is [1a, 2b, 3c, 4d, 3e, 1f, 1g] - invalid
# Combination 144 is [1a, 2b, 3c, 4d, 3e, 2f, 1g] - valid

n = 20 # number of sides
start_paths = [1]
next_paths = []
count = 0
while count <= (n - 1)
  inner_count = 0
  while inner_count < (start_paths.length + 1)
    first_element = inner_count-1 < 0 ? 0 : start_paths[inner_count-1]
    second_element = inner_count == start_paths.length ? 0 :  start_paths[inner_count]
    next_paths << first_element + second_element
    inner_count += 1
  end
  puts "#{next_paths.join(', ')}"
  start_paths = next_paths
  next_paths = []
  inner_count = 0
  count += 1
end
puts "Finished expansion, now onto contraction"
count = 0
while count <= (n - 1)
  inner_count = 0
  while inner_count < (start_paths.length - 1) 
    next_paths << start_paths[inner_count] + start_paths[inner_count + 1]
    inner_count += 1
  end
  puts "#{next_paths.join(', ')}"
  start_paths = next_paths
  next_paths = []
  inner_count = 0
  count += 1
end

puts "There are #{(2*n).factorial/(n.factorial)**2} paths from one end to the other in a n x n grid"


# This is a check for the data in another similar problem

n = 14 # number of sides
start_paths = [1]
next_paths = []
count = 0
while count <= (n - 1)
  inner_count = 0
  while inner_count < (start_paths.length + 1)
    first_element = inner_count-1 < 0 ? 0 : start_paths[inner_count-1]
    second_element = inner_count == start_paths.length ? 0 :  start_paths[inner_count]
    next_paths << first_element + second_element
    inner_count += 1
  end
  puts "#{next_paths.join(', ')}"
  start_paths = next_paths
  next_paths = []
  inner_count = 0
  count += 1
end

puts "The total is #{start_paths.inject {|result, element| result + element}}"