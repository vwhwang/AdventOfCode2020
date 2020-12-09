
raw_data = File.read("day6_input.txt")

customers = raw_data.split(/\n{2,}/)
customers.each do |string|
  string.delete!("\n")
end 


check_list = []

customers.each do |string|
  check_list << string.split("")
end 

sum = 0 
check_list.each do |c|
  sum += c.uniq.length 
end  

# p sum 

customer_part2 = raw_data.split(/\n{2,}/)
list = []
customer_part2.each do |string|
  list << string.split("\n")
end 

# p list 

def check_yes(input)
  if input.length == 1 
    return input[0].length 
  end 
  yes_list = {}
  input.each do |answer|
    i = 0 
    while i < answer.length 
      if yes_list[answer[i]]
        yes_list[answer[i]] += 1 
      else  
        yes_list[answer[i]] = 1 
      end 
      i += 1 
    end 
  end 
  num_yes = yes_list.select {|k,v|v == input.length}
  return num_yes.length
end 

p check_yes(["abc"])
p check_yes(["ab", "ac"])
p check_yes(["a", "a", "a", "a"])

all_say_yes = 0 
list.each do |c|
  all_say_yes += check_yes(c)
end 

p all_say_yes