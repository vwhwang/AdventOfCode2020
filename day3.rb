# file_data = File.readlines("day3_input.txt").map(&:chomp)

# p file_data

# file_data array of trees 
# pointer on where on the map 
# if encounter end of an array restart from begin
# Go right 3 , down 1 
# pointer = [path,step]
def go_right(pointer, file_data, num)
  pointer[1] = pointer[1] + num
  if pointer[1] > file_data[0].length - 1 
    pointer[1] = pointer[1] - file_data[0].length 
  end 
  return pointer
end 

def go_down(pointer,file_data,num)
  pointer[0] = pointer[0] + num 
  return pointer 
end 

# p file_data[0].length
# p go_right([0,30], file_data)
# p go_down([0,30], file_data)

# going through the woods 
i = 0 
on_map = [0,0]

testing = 0 

# while on_map[0] < file_data.length - 1
#   go_right(on_map,file_data,3)
#   go_down(on_map,file_data,1)
#   if file_data[on_map[0]][on_map[1]] == "#"
#     testing += 1 
#   end 
# end 

# p testing 

def explore(file_data,right,down)
  on_map = [0,0]
  count = 0
  while on_map[0] < file_data.length - 1
    go_right(on_map,file_data,right)
    go_down(on_map,file_data,down)
    if file_data[on_map[0]][on_map[1]] == "#"
      count += 1 
    end 
  end 
  return count 
end 

# p explore(file_data,3,1)

#I Right 1, down 1.
#II Right 3, down 1. (This is the slope you already checked.)
#III Right 5, down 1.
#IV Right 7, down 1.
#V Right 1, down 2.

# p explore(file_data,1,1)
# p explore(file_data,3,1)
# p explore(file_data,5,1)
# p explore(file_data,7,1)
# p explore(file_data,1,2)


# a = explore(file_data,1,1)
# b = explore(file_data,3,1)
# c = explore(file_data,5,1)
# d = explore(file_data,7,1)
# e = explore(file_data,1,2)

# answer = a*b*c*d*e

# p answer


## day 1 PART II 


report_input = File.readlines("day1_input.txt").map(&:chomp)
p report_input

# pick any 2 combo and check if the 3rd add up to 2020 

hash = {} 
i = 0 
while i < report_input.length - 1 
  j = 1 
  while j < report_input.length 
    sum = report_input[i].to_i + report_input[j].to_i
    if  sum < 2020
      hash[2020 - sum ] = [report_input[i].to_i, report_input[j].to_i] 
    end 
    j += 1 
  end 
  i += 1
end 

answer =  hash.select{|key, v| report_input.include?(key.to_s)}
answer.each do |k,v|
   p k * v[0] * v[1]
end 


