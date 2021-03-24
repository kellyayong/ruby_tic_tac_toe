class Board
    attr_accessor :cell

    WINNING_POSITIONS = [
        [0,1,2], [3,4,5], [6,7,8], [0,3,6], 
        [1,4,7], [2,5,8], [0,4,8], [2,4,6]
    ].freeze

    def initialize
        @cell = [1,2,3,4,5,6,7,8,9]
    end

    def show
        board = "\n"\
        " #{cell[0]} | #{cell[1]} | #{cell[2]}\n"\
        "----------\n"\
        " #{cell[3]} | #{cell[4]} | #{cell[5]}\n"\
        "----------\n"\
        " #{cell[6]} | #{cell[7]} | #{cell[8]}\n"\
        " \n"
        puts board
    end

    def update_board(number,symbol)
        cell[number] = symbol
    end

    def valid_move?(number)
        cell[number-1] == number
    end

    def draw?
        @cell.all? {|cell| cell =~ /\D/} 
    end

    def won?
        WINNING_POSITIONS.any? do |position| 
            [cell[position[0]], cell[position[1]], cell[position[2]]].uniq.length == 1
        end
    end

end