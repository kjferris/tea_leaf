CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

def display_winning_message(winning_choice)
  case winning_choice
  when 'p'
    puts "Paper covers Rock!"
  when 'r'
    puts "Rock crushes Scissors!"
  when 's'
    puts "Scissors cuts Paper!"
  end
end



loop do 
  
  begin
    puts 'Choose rock(r), paper(p), or scissors(s)'
    player_input = gets.chomp
  end until CHOICES.keys.include?(player_input)

computer_choice = CHOICES.keys.sample

  if player_input == computer_choice
    puts "You've tied!"
  elsif player_input == 'r' && computer_choice == 's' || player_input == 'p' && computer_choice == 'r' || player_input == 's' && computer_choice == 'p'
  
    display_winning_message(player_input)
    puts "You've won!"
  else
    display_winning_message(computer_choice)
    puts "Computer won!" 
  end

  puts "Press 'y' to play again"
  break if gets.chomp.downcase != 'y'

end

puts "Bye quitter!"