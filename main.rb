require_relative ('game')
require_relative ('player')

def create_player(player_number, symbol)
    puts "Enter Player #{player_number}'s name:"
    name = gets.chomp
    player = Player.new(name, symbol)
end

game = Game.new(create_player(1, :x), create_player(2, :o))
