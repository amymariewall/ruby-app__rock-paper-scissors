require 'pry'

def number_needed_to_win_set
puts "How many games do you want in your set?"
return gets.chomp.to_i/2
end

def meet_player_1
puts "Player 1, please enter your name:"
  player_1_name = gets.chomp
  puts "Hello, #{player_1_name}!"
  return player_1_name
end

def meet_player_2
puts "Player 2, please enter your name:"
  player_2_name = gets.chomp
  puts "Hello, #{player_2_name}!"
  return player_2_name
end

def get_player_1_weapon
  puts "Player 1, enter your move:"
  return gets.chomp.downcase
end

def get_player_2_weapon
  puts "Player 2, enter your move:"
  return gets.chomp.downcase
end

def set_winner(p1_weapon, p2_weapon)
  
  if p1_weapon == p2_weapon
      return 0
  end

  if p1_weapon == 'paper'
    if p2_weapon == 'rock'
      return 1
    end
    if p2_weapon == 'scissors'
      return 2
    end

  elsif p1_weapon == 'scissors'
    if p2_weapon == 'rock'
      return 2
    end
    if p2_weapon == 'paper'
      return 1
    end

  elsif p1_weapon == 'rock'
    if p2_weapon == 'paper'
      return 2
    end
    if p2_weapon == 'scissors'
      return 1
    end
  end
end

def add_win_to_score(winner)
  if winner == 1
    @player_1_score += 1
  elsif winner == 2
    @player_2_score += 1
  end
end


def alert_winner(winner)
  if winner == 0
    puts "That's a draw!"
  elsif winner == 1
    puts "Player 1 wins set number #{@set_number}!"
  elsif winner == 2
    puts "Player 2 wins set number #{@set_number}!"
  end
end

def game_winner
  if @player_1_score > @player_2_score
    return @player_1_name
  elsif @player_2_score > @player_1_score
    return @player_2_name
  end
end


############### ACTUAL PROGRAM STARTS BELOW ################################

# Ask how many games the players want to play
win_number = number_needed_to_win_set

# Meet the players and store their names
@player_1_name = meet_player_1
@player_2_name = meet_player_2

# Set scoreboard and set count to 0
@player_1_score = 0
@player_2_score = 0
@set_number = 0

# Begin playing games until one player gets enough wins to win set

until @player_1_score > win_number || @player_2_score > win_number

# I could probably keep refactoring and make the 
# set_number count and set_number display a method if I wanted.

# Am just now realizing that set number probably doesn't need to be an
# instance variable. I could just pass it in as an argument to the alert_winner
# method. I have a feeling that is a better idea...

  @set_number += 1


  puts "Okay, it's set number: #{@set_number}."

  # Get weapon choice from player 1 and player 2
  
  p1_weapon = get_player_1_weapon
  p2_weapon = get_player_2_weapon

  # Determine who is the winner of a set, or if it's a tie

  set_winner = set_winner(p1_weapon, p2_weapon)

  # Add the score to the scoreboard

  add_win_to_score(set_winner)

  # Tell the players who won that set

  alert_winner(set_winner)

  # Show the scoreboard and set number before the next game in set begins
 
  puts "\nEnd of set number #{@set_number}.\nThe current score is:\nPlayer 1: #{@player_1_score}\nPlayer 2: #{@player_2_score}\n\n\n"
end

################# LOOP END ############################

# Determine the game winner and store his/her name 
# Should winner be an instance variable???

winner = game_winner

# Tell the players who won

puts "And the winner is.....#{winner}! Congratulations, #{winner}!"

################ PROGRAM END #################


