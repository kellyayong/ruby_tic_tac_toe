def display_welcome
    puts "\n  Welcome to Tic Tac Toe! :)"
    puts "\n"
end

def display_create_player(num)
    print "Enter Player #{num}'s name: "
end

def display_player_info(name, symbol, num)
    puts "#{name} - You are Player #{num} and your symbol is #{symbol}"
end

def display_cell_input(name, symbol)
    print " #{name} - Enter 1 to 9 to draw #{symbol} on the board: "
end

def display_invalid_move(number)
    puts "Cell number: #{number} is not available, please enter a different number"
end

def display_game_over
    puts "Game over!"
end

def display_winning_message(player)
    puts "#{player.name} won!"
end

def display_draw_message 
    puts "It's a tie!"
end

def display_play_again
    print "Do you want to play again? [y/n] "
end

def display_error_answer
    puts "Error - Please enter 'y' or 'n'"
end

def display_goodbye
    puts "\n Thanks for playing! Goodbye :)"
end