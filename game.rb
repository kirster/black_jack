require_relative './dealer'
require_relative './player'
require_relative './card'

class Game
  def start_game
    @game_bank = 0
    @dealer = Dealer.new
    puts 'Enter your name: '
    name = gets.chomp
    @player = Player.new(name)
    first_round
  end

  def first_round
    2.times { @player.hand.add_card }
    puts @player.hand.cards
    puts @player.hand.points
    @player.bank -= 10

    2.times { @dealer.hand.add_card }
    @dealer.bank -= 10
    @game_bank += 20
  end
end
