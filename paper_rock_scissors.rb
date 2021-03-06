
player_picked = ""
comp_picked = ""
play_again_bool = TRUE
corr_input_bool = FALSE
int = 0

# Prints out text, returns user input, like Python's input() function
def get_input message

    puts message
    input = gets.chomp.downcase

end

# Format comp messages to start with >>
def puts message
  print ">> " + message +"\n"
end

# Computer randomly chooses item, returns chosen item
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

# Records what user picked, also returns what user picked.
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
  puts "You picked #{player_picked} and Computer picked #{comp_picked}"
end

# Prints results of game
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
    1
  elsif input == "n"
    2
  else
    3
  end
end

# Did user enter letters P R or S? Returns boolean.
def corr_input_PRS?(input)
  if input == "p" || input == "r" || input == "s"
    return TRUE
  else
    return FALSE
  end
end

# Did user enter anything other than y or n? Return boolean AND return integer
def corr_input_play_again?(input)
  if input == 3
    return FALSE, input
  else
    return TRUE, input
  end
end

############# Start of program ###################################################
puts "Play Paper Rock Scissors!"    # Welcome message, occurs once.

# Until the user quits, continuing playing.

# Loop until user wants to quit.
while play_again_bool == TRUE

  # Loop until user enters an acceptable input.
  while corr_input_bool == FALSE
    input = get_input("Choose one: (P/R/S)")
    corr_input_bool = corr_input_PRS?(input)
    player_picked = record_users_choice(input)
  end

  corr_input_bool = FALSE

  comp_picked = determine_what_comp_picks()
  print_what_each_player_picked(player_picked, comp_picked)
  print_which_player_wins(player_picked, comp_picked)

  # Loop until user enters an acceptable input.
  while corr_input_bool == FALSE
    input = ask_play_again?()
    corr_input_bool, int = corr_input_play_again?(input)
  end

  corr_input_bool == FALSE

  if int == 1
    play_again_bool = TRUE
  elsif int == 2
    play_again_bool = FALSE
  end

  corr_input_bool = FALSE

end
