passes = File.readlines("day5_input.txt").map(&:chomp)
# p passes

testing = "BFFFBBFRRR"
def seat_number(s,rows, cols)
  low_row = 0 
  high_row = rows 
  low_col = 0 
  high_col = cols 
  i = 0 
  while i < s.length

    zone = s[i]
    if zone == "B" || zone == "F"
      update =  find_range(low_row,high_row,zone)
      low_row = update[0]
      high_row = update[1]
    else 
      update =  find_range(low_col,high_col,zone)
      low_col = update[0]
      high_col = update[1]
    end  
    i += 1 
  end 
  final_row = s[6] == "F" ? low_row : high_row
  final_col = s[9] == "L" ? low_col : high_col
  # p final_row
  # p final_col
  return final_row * 8 + final_col
end 

def find_range(low,high,is_up_right)
  middle = (low + high) / 2 
  if is_up_right == "B" || is_up_right == "R"
    low = middle + 1 
  else  
    high = middle
  end 
  return [low, high]
end 

# p seat_number("BFFFBBFRRR",127, 7)
max = 0 
min = nil 
all_seats = []
passes.each do |info|
  seat = seat_number(info,127, 7)
  if seat > max 
    max = seat
  end 
  if min == nil 
    min = seat
  end 
  if seat < min 
    min = seat
  end 
  all_seats << seat 
end 
# p min 
# p max 
all_seats.sort!
# p all_seats

# p all_seats.length 
i = 84

previous = 84
all_seats.each do |n|
  diff = n - previous
  if diff != 1 
    p n 
    p previous
  end 
  previous = n  
end 


