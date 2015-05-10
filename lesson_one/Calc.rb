puts "Please enter a number."

num_1 = gets.chomp

puts "You've entered #{num_1}. Please enter a second number."
num_2 = gets.chomp

puts "Press 1 for addition, press 2 for subtraction, press 3 for multiplication, press 4 for division"

num_3 = gets.chomp
loop do 

if num_3 == "1" 
  num_4 = num_1.to_i + num_2.to_i
  puts num_4  
  break
elsif num_3 == "2"
  num_4 = num_1.to_i - num_2.to_i
  puts num_4
  break
elsif num_3 == "3"
  num_4 = num_1.to_i * num_2.to_i
  puts num_4
  break
elsif num_3 == "4"
  num_4 = num_1.to_f / num_2.to_f
  puts num_4
  break
else
  puts "please enter a valid option"
  
end
end