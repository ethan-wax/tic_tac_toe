require_relative 'board'

class Game
    def initialize(p1, p2)
        @player1 = p1.get_name
        @player2 = p2.get_name
        @game_board = Board.new()
        @x_win = false
        @o_win = false
    end

    def win?
        if @game_board.row_win(:x)
            @x_win = true
            return true
        elsif @game_board.row_win(:o)
            @o_win = true
            return true
        end
    end
end