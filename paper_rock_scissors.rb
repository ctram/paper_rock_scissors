require 'pry'

# TODO if user enters anything other than acceptable inputs, repeat the questions

player_picked = ""
comp_picked = ""
play_again = TRUE

# Method that puts a message to CL and gets user's input, setting it to variable "input"
def input message
  puts ">> " + message
  input = gets.chomp.downcase
end

# Method that returns which item computer picks.
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

# Record what item user picks.
def record_users_choice input
  if input == "p"
    player_picked = "Paper"
  elsif input == "r"
    player_picked = "Rock"
  elsif input == "s"
    player_picked = "Scissors"
  end
end


def print_what_each_player_picked player_picked, comp_picked
  puts "You picked #{player_picked} and Computer picked #{comp_picked}"
end

def print_which_item_wins player_picked, comp_picked
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



############# Start of program ###################################################
puts "Play Paper Rock Scissors!"

while play_again == TRUE




  play_again == FALSE
end
