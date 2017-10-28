require_relative './dealer'
require_relative './player'
require_relative './card'

class Game
  def start_game
    @game_bank = 0
    @dealer = Dealer.new
    puts "Enter your name: "
    name = gets.chomp
    @player = Player.new(name)
    first_round
  end

  def first_round
    2.times { @player.hand << Card.new }
    @player.make_bet
    2.times { @dealer.hand << Card.new }
    @dealer.make_bet
    @game_bank += 20
  end
end

#game = Game.new
#game.start_game