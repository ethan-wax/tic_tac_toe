require_relative 'board'

class Game
    def initialize(p1, p2)
        @player1 = p1.get_name
        @player2 = p2.get_name
        @game_board = Board.new()
        @x_win = false
        @o_win = false
        @p1_turn = true
    end

    def win?
        if @game_board.win_row(:x)
            @x_win = true
            return true
        elsif @game_board.win_col(:o)
            @o_win = true
            return true
        elsif @game_board.win_col(0,:x) || @game_board.win_col(1,:x) || @game_board.win_col(2,:x)
            @x_win = true
            return true
        elsif @game_board.win_col(0,:o) || @game_board.win_col(1,:o) || @game_board.win_col(2,:o)
            @o_win = true
            return true
        elsif @game_board.win_diag(:x)
            @x_win = true
            return true
        elsif @game_board.win_diag(:o)
            @o_win = true
            return true
        else
            return false
        end
    end

    def play_game
        until win?()
            @game_board.print_board
            if @p1_turn
                puts "Please enter where you would like to mark:"
                input = gets.chomp
                while @game_board.get_tile(input) == " "
                    puts "Please enter an unmarked tile:"
                    input = gets.chomp
                end
                @game_board.mark_tile(:x, input)
                victory() if win?
            else
                puts "Please enter where you would like to mark:"
                input = gets.chomp
                while @game_board.get_tile(input) == " "
                    puts "Please enter an unmarked tile:"
                    input = gets.chomp
                end
                @game_board.mark_tile(:o, input)
                victory() if win?
            end
        end
    end
end