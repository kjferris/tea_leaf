cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace" ]

card_suits = ["Clubs", "Hearts", "Spades", "Diamonds"]

card_deck = cards.product(card_suits)

player_cards = []

dealer_cards = []

def calculate_cards(cards)
  arr = cards.map{|e| e[0] }
  
  total = 0
  arr.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0 
      total += 10
    else
      total += value.to_i
    end
  end

  arr.select{|e| e == "Ace"}.count.times do
    total -= 10 if total > 21
  end
  
  total
end

puts "Welcome to blackjack. What is your name?"

player_name = gets.chomp

puts "Welcome #{player_name}. This is single deck blackjack. Do you know how to play? Enter y/n."

how_to_play = gets.chomp

if how_to_play == "n"
puts "The goal of blackjack is to beat the dealer's hand without going over 21. Face cards are worth 10. Aces are worth 1 or 11, whichever makes a better hand.
To 'Hit' is to ask for another card. To 'Stand' is to hold your total and end your turn."
else 
  puts "Great, lets get started."
end


card_deck.shuffle!
player_cards << card_deck.pop
dealer_cards << card_deck.pop
player_cards << card_deck.pop
dealer_cards << card_deck.pop

player_cards_total = calculate_cards(player_cards)

dealer_cards_total = calculate_cards(dealer_cards)

puts "You have been dealt " + player_cards[0].to_s + " and " + player_cards[1].to_s

puts "Your total is #{player_cards_total}"

puts "The dealer's top card is " + dealer_cards[1].to_s

if player_cards_total == 21 && dealer_cards_total == 21
  puts "Push!"
  exit
elsif
  dealer_cards_total == 21
  puts "Dealer reveals #{dealer_cards}. Dealer has hit blackjack, you lose."
  exit
elsif
  player_cards_total == 21
  puts "You've hit blackjack!"
  exit
end


while player_cards_total < 21
  puts "Would you like to hit or stand?"
  choice = gets.chomp
  
  if choice == "stand"
    puts "You stand with a total of #{player_cards_total}"
    break
  end

  if choice == "hit"
    new_card = card_deck.pop
    player_cards << new_card
    player_cards_total = calculate_cards(player_cards)
    puts "You've been dealt a #{new_card}. Your new total is #{player_cards_total}"
  end
  
  if player_cards_total > 21
    puts "You've bust"
    exit
  elsif player_cards_total == 21
    puts "You have 21!"
    next
  end
  
end

puts "The dealer flips his card and reveals a #{dealer_cards}. The dealer has a total of #{dealer_cards_total}."

if dealer_cards_total > 17 
  puts "The dealer stands at #{dealer_cards_total}."
end

while dealer_cards_total < 17
  puts "The dealer will hit."
  new_card = card_deck.pop
  dealer_cards << new_card
  dealer_cards_total = calculate_cards(dealer_cards)
  puts "The dealer's new card is #{new_card}. For a total of #{dealer_cards_total}. "
  if dealer_cards_total > 21
    puts "The dealer has busted. You Win!"
    exit
  end
end

if dealer_cards_total > player_cards_total
  puts "Sorry, dealer wins."
  elsif dealer_cards_total < player_cards_total
  puts "You Win! You have #{player_cards_total} and the dealer has #{dealer_cards_total}."
  elsif dealer_cards_total == player_cards_total
  puts "You push."
end








