require_relative './dealer'
require_relative './player'

class Game
  attr_reader :game_bank

  def start_game
    @game_bank = 0
    @dealer = Dealer.new
    puts 'Enter your name: '
    name = gets.chomp
    @player = Player.new(name)
    first_round
  end

  private

  def first_round
    2.times { @player.add_card }
    puts "#{@player.name}: #{@player.hand.cards}, points: #{@player.hand.points}"
    @player.bank -= 10

    2.times { @dealer.add_card }
    puts "#{@dealer.name}: * *"
    @dealer.bank -= 10

    @game_bank += 20
  end
end

game = Game.new
game.start_game