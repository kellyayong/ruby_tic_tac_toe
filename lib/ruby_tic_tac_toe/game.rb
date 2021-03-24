require_relative "display.rb"

class Game 
    attr_accessor :first_player, :second_player, :current_player, :other_player
    def initialize
        @first_player = first_player
        @second_player = second_player
        @current_player = current_player
        @other_player = other_player
        @board = Board.new
    end

    def play
        display_welcome
        setup_players
        @board.show
        player_take_turns
        ending
    end


    def create_player(num)
        display_create_player(num)
        name = gets.chomp.capitalize
        symbols = ["X","O"]
        symbol = symbols[num-1]
        display_player_info(name, symbol, num)
        Player.new(name, symbol)
    end

    def setup_players
        @first_player = create_player(1)
        @second_player = create_player(2)
        @current_player = first_player
        @other_player = second_player
    end

    def turn(player)
        cell = turn_input(player)
        @board.update_board(cell - 1, player.symbol)
        @board.show
    end

    def turn_input(player)
        display_cell_input(player.name, player.symbol)
        number = gets.chomp.to_i
        return number if @board.valid_move?(number)
        display_invalid_move(number)
        turn_input(player)
    end

    def switch_player
        turn(current_player)
        @current_player, @other_player = @other_player, @current_player
    end

    def player_take_turns
        until @board.draw? 
            switch_player
            break if @board.won?
        end
    end

    def ending
        @board.won? ? (display_winning_message(other_player)) : (display_draw_message)
    end

end