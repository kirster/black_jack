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
    2.times { @player.add_card }
    @player.cards
    puts @player.points
    @player.make_bet
    2.times { @dealer.add_card }
    puts @dealer.hidden_cards
    @dealer.make_bet
    @game_bank += 20
  end
end
