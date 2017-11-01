require_relative './game'

class Interface
  attr_reader :game

  def create_game
    puts 'Start new game - 1, quit - 0'
    if gets.chomp.to_i == 1
      puts 'Enter your name: '
      name = gets.chomp
      @game = Game.new(name)
      game.connect_interface(self)
      start_game
    else
      puts 'You finished playing Black Jack'
    end
  end

  def start_game
    loop do
      break if game.game_stop?
      game.setup_turn
      puts '=================================='
      puts 'New turn'
      game.first_round
      puts game.player.info
      puts 'Dealer: * *'
      game.one_turn
      print_winner
      puts game.player.info
      puts game.dealer.info
    end
    create_game
  end

  def user_input
    puts ''
    puts '1 - skip move' unless game.player.skipped
    puts '2 - add a card' if game.player.hand.cards.size < 3
    puts '3 - show cards'
    print 'Enter command:'
    puts ''
    gets.chomp.to_i
  end

  def print_winner
    case game.turn_winner
    when 'drawn' then puts 'Drawn for this turn'
    when 'player' then puts 'Player wins this turn'
    else puts 'Dealer wins this turn'
    end
  end
end

Interface.new.create_game
