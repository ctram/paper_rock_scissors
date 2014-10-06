require 'pry'

# TODO if user enters anything other than acceptable inputs, repeat the questions

player_picked = ""
comp_picked = ""
play_again_bool = TRUE

# Method: prints out text, returns user input
def get_input message
  puts message
  input = gets.chomp.downcase
end

def puts message
  print ">> " + message +"\n"
end

# Method : computer randomly chooses item, returns chosen item
def determine_what_comp_picks
  random = [1,2,3].shuffle
  choice = random[0]

  if choice == 1
    comp_picked = "Paper"
  elsif choice == 2
    comp_picked = "Rock"
  elsif choice == 3
    comp_picked = "Scissors"
  end

end

# Method: returns what user picked.

def record_users_choice input

  if input == "p"
  player_picked = "Paper"
  elsif input == "r"
    player_picked = "Rock"
  elsif input == "s"
    player_picked = "Scissors"
  end
end

# Prints what user and computer picked.
def print_what_each_player_picked player_picked, comp_picked
  puts " You picked #{player_picked} and Computer picked #{comp_picked}"
end

# Prints results
def print_which_player_wins player_picked, comp_picked
  if player_picked == comp_picked
    puts "It's a tie!"
  elsif player_picked == "Paper"
    if comp_picked == "Rock"
      puts "Paper wraps Rock, you win!"
    elsif comp_picked == "Scissors"
      puts "Scissors cuts Paper, you lose!"
    end
  elsif player_picked == "Rock"
    if comp_picked == "Paper"
      puts "Paper wraps Rock, you lose!"
    elsif comp_picked == "Scissors"
      puts "Rock crushes Scissors, you win!"
    end
  elsif player_picked == "Scissors"
    if comp_picked == "Paper"
      puts "Scissors cut Paper, you win!"
    elsif comp_picked == "Rock"
      puts "Rock crushes Scissors, you lose!"
    end
  end
end

# Checks whether player wants to continue, returns boolean.
def ask_play_again?()
  input = get_input "Play again?"
  if input == "y"
    TRUE
  else
    FALSE
  end
end

############# Start of program ###################################################
puts "Play Paper Rock Scissors!"    # Welcome message, occurs once.

# Until the user quits, continuing playing.

while play_again_bool == TRUE
  input = get_input("Choose one: (P/R/S)")
  player_picked = record_users_choice(input)
  comp_picked = determine_what_comp_picks()
  print_what_each_player_picked(player_picked, comp_picked)
  print_which_player_wins(player_picked, comp_picked)
  play_again_bool = ask_play_again?()
end
