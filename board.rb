class Board
    def initialize
        @top_row = Array.new(3)
        @mid_row = Array.new(3)
        @bot_row = Array.new(3)
    end

    def win_row(sym)
       return @top_row.all?(sym) || @mid_row.all?(sym) || @bot_row.all?(sym)
    end
end