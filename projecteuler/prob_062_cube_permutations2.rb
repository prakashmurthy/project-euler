# def cubePermute(n)
#   i=0
#   cubes = {}
#   loop do
#     i+=1
#     key = (i*i*i).to_s.split(//).sort.join
#     cubes[key]=[] if cubes[key].nil?
#     cubes[key] << i
#     if cubes[key].size==n
#       return cubes[key]
#     end
#   end
# end
# 
# puts cubePermute(5)
# MAX_NUMBER = 5
# def cube_permute(number)
#   index = 0
#   cubes = {}
#   
#   loop do
#     index += 1
#     key = (index**3).to_s.split(//).sort.join
#     cubes[key] = [] if cubes[key].nil?
#     cubes[key] << index
#     
#     if cubes[key].size == number
#       return cubes[key]
#     end
#   end
# end
# permutations = cube_permute(MAX_NUMBER)
# puts "The #{MAX_NUMBER} cubes are : #{permutations.join(', ')}"
# puts "The smallest cube is #{permutations[0]**3}."

l = {} and (1..10000).each {|i| 
	s = "#{i**3}".split("").sort.join("")
	l[s] = l[s].nil? ? [1, i**3] : (l[s][0] == 4 ? abort(l[s][1].to_s) : [l[s][0] + 1, l[s][1]])
}