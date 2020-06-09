class Game
    def initialize(p1, p2)
        @player1 = p1.get_name
        puts "#{@player1}"
        @player2 = p2.get_name
        puts "#{@player2}"
    end
end