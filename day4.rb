raw_data = File.read("day4_input.txt")

customers = raw_data.split(/\n{2,}/)

# encounter ":"
# keep 3 digit before and count it 
# numbers 
# if there is cid 

# only return true if 8 or cid falst and only 7 

p "cdi:chesdfd bbc:ds".split(":")

def check_valid(string)
  nums = 0
  cid_check = false  
  i = 0 
  while i < string.length 
    if string[i] == ":"
      nums += 1 
      info = string[i-3] + string[i-2] + string[i-1]
      if info == "cid"
        cid_check = true 
      end 
    end 
    i += 1  
  end 

  if nums == 8 || ( nums == 7 && cid_check == false) 
    return true
  else  
    return false 
  end 
end 

valid = 0 
first_round = []
customers.each do |c|
  if check_valid(c)
    first_round << c 
    valid += 1 
  end 
end 

# p valid
# p first_round.length 


def customer_hash_info(string)
  hash = {}
  i = 0 
  while i < string.length 
    if string[i] == ":"
      info = string[i-3] + string[i-2] + string[i-1]
      j = i + 1 
      information = ""
      until string[j] == " " || string[j] == "\n"|| string[j].nil? 
        information += string[j]
        j += 1 
      end 
      hash[info] = information
    end
    i += 1  
  end 
  return hash 
end 

pool_list = []
first_round.each do |c|
  pool_list << customer_hash_info(c)
end 

# rules 
def is_valid(digit, hash_info)
  case digit 
  when "byr"
    return hash_info[digit].to_i >=1920 && hash_info[digit].to_i <=2002 ? true : false
  when "iyr"
    return hash_info[digit].to_i >=2010 && hash_info[digit].to_i <=2020 ? true : false 
  when "eyr"
    return hash_info[digit].to_i >=2020 && hash_info[digit].to_i <=2030 ? true : false 
  when "hgt"
    if hash_info[digit].include? "cm"
      return hash_info[digit].to_i >=150 && hash_info[digit].to_i <=193 ? true : false
    end 
    if hash_info[digit].include? "in"
      return hash_info[digit].to_i >=59 && hash_info[digit].to_i <=76 ? true : false
    end 
    return false 
  when "hcl"
    return hash_info[digit].match(/#[0-9a-z]{6}$/) ? true : false 
  when "ecl"
    return ["amb", "blu","brn", "gry", "grn", "hzl", "oth"].include? hash_info[digit]   
  when "pid"
    return hash_info[digit].match(/^[0-9]{9}$/) ? true : false 
  when "cid"
    return true 
  else 
    p "error"
  end 
end 

p pool_list[1]



# count = 1 
# pool_list[1].keys.each do |k|
#   if !is_valid(k, pool_list[1])
#     count = 0 
#     return count 
#   end 
# end 

def check_person(person)
  count = 1 
  person.keys.each do |k|
    if !is_valid(k,person)
      count = 0 
      return count 
    end 
  end 
  return count 
end 

p check_person(pool_list[1])

pass = 0 
pool_list.each do |passenger|
  pass += check_person(passenger)
end 

p pass 
