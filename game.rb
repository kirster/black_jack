require_relative './dealer'
require_relative './player'
require_relative './card'

class Game
  def start_game
    @dealer = Dealer.new
    puts "Enter your name: "
    name = gets.chomp
    @player = Player.new(name)
  end
end