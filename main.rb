require_relative ('game')
require_relative ('player')

def create_player(player_number)
    puts "Enter Player #{player_number}'s name:"
    name = gets.chomp
    player = Player.new(name, :x)
end

game = Game.new(create_player(1), create_player(2))
