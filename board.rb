class Board
    def initialize
        @top_row = Array.new(3)
        @mid_row = Array.new(3)
        @bot_row = Array.new(3)
    end

    def win_row(sym)
       return @top_row.all?(sym) || @mid_row.all?(sym) || @bot_row.all?(sym)
    end

    def win_col(num, sym)
        return @top_row[num] == sym && @mid_row[num] == sym && @bot_row[num] == sym
    end

    def win_diag(sym)
        return (@top_row[0] == sym && @mid_row[1] == sym && @bot_row[2] == sym) || (@top_row[2] == sym && @mid_row[1] == sym && @bot_row[0] == sym)
    end

    def print_board
        puts "    |   |   "
        puts "1 #{@top_row[0]} | #{@top_row[1]} | #{@top_row[2]} "
        puts "    |   |   "
        puts " ___________"
        puts "    |   |   "
        puts "2 #{@mid_row[0]} | #{@mid_row[1]} | #{@mid_row[2]} "
        puts "    |   |   "
        puts " ___________"
        puts "    |   |   "
        puts "3 #{@bot_row[0]} | #{@bot_row[1]} | #{@bot_row[2]} "
        puts "    |   |   "
        puts "  a   b   c"
    end

    def mark_tile(sym, coord)
        assert(coord.class == String && coord.length == 2)
        mark = case sym
        when :x then "x"
        when :o then "o"
        end
        col = coord[0]
        row = coord[1]
        case row
        when "1" 
            mark_row = @top_row
        when "2"
            mark_row = @mid_row
        when "3"
            mark_row = @bot_row
        end
        case col
        when "a"
            mark_row[0] = mark
        when "b"
            mark_row[1] = mark
        when "c"
            mark_row[2] = mark
        end
    end
end