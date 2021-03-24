require_relative "ruby_tic_tac_toe/version"
require_relative "./ruby_tic_tac_toe/player.rb"
require_relative "./ruby_tic_tac_toe/board.rb"
require_relative "./ruby_tic_tac_toe/game.rb"
require_relative "./ruby_tic_tac_toe/display.rb"

def start_game
    game = Game.new
    game.play
    play_again?
end

def play_again?
    display_play_again
    answer = gets.chomp.downcase
    if answer == "y"
        game = Game.new
        game.play
    elsif answer == 'n'
        puts display_goodbye
    else 
        display_error_answer
    end
end

start_game