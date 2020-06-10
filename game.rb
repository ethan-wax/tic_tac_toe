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
        if @game_board.win_row("x")
            @x_win = true
            return true
        elsif @game_board.win_row("o")
            @o_win = true
            return true
        elsif @game_board.win_col(0,"x") || @game_board.win_col(1,"x") || @game_board.win_col(2,"x")
            @x_win = true
            return true
        elsif @game_board.win_col(0,"o") || @game_board.win_col(1,"o") || @game_board.win_col(2,"o")
            @o_win = true
            return true
        elsif @game_board.win_diag("x")
            @x_win = true
            return true
        elsif @game_board.win_diag("o")
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
                puts "It is #{@player1}'s turn"
                puts "Please enter where you would like to mark:"
                input = gets.chomp
                while @game_board.get_tile(input) != " "
                    puts "Please enter an unmarked tile:"
                    input = gets.chomp
                end
                @game_board.mark_tile(:x, input)
                victory() if win?()
                @p1_turn = false
            else
                puts "It is #{@player2}'s turn"
                puts "Please enter where you would like to mark:"
                input = gets.chomp
                while @game_board.get_tile(input) != " "
                    puts "Please enter an unmarked tile:"
                    input = gets.chomp
                end
                @game_board.mark_tile(:o, input)
                victory() if win?()
                @p1_turn = true
            end
        end
    end

    def victory
        @game_board.print_board
        if @x_win
            puts "Congratulations #{@player1}, you win!"
        elsif @o_win
            puts "Congratulations #{@player2}, you win!"
        end
        play_again
    end

    def tie
        if @game_board.full_board && !win?()
            puts "It's a tie!"
            play_again
        end
    end


    def play_again
        puts ""
        puts "Would you like to play again? (y/n)"
        input = gets.chomp
        case input
        when "y"
            @game_board = Board.new()
            @x_win = false
            @o_win = false
            @p1_turn = true
            play_game
        when "n"
            puts "Thanks for playing!"
        else
            puts "Bruh..."
        end
    end
end