require_relative './game'

class Interface
  attr_reader :game

  def create_game
    puts 'Start new game - 1, quit - 0'
    if gets.chomp.to_i == 1
      puts 'Enter your name: '
      @game = Game.new(gets.chomp)
      start_game
    else
      puts 'You finished playing Black Jack'
    end
  end

  def start_game
    while game.game_continue?
      puts '=================================='
      puts 'New turn'
      game.first_round
      puts game.player.info
      puts 'Dealer: * *'
      turn
      print_winner
      puts game.player.info
      puts game.dealer.info
    end
    create_game
  end

  def turn
    loop do
      break if game.stop_turn?
      user_input
    end
  end

  def user_input
    puts ''
    puts 'skip - to skip a move' unless game.player.skipped
    puts 'add - to add a card' unless game.player.hand.full_hand?
    puts 'show - to show cards'
    print 'Enter command:'
    puts ''
    game.one_turn(gets.chomp.to_sym)
  end

  def print_winner
    case game.turn_winner
    when :drawn then puts 'Drawn for this turn'
    when :player then puts 'Player wins this turn'
    else puts 'Dealer wins this turn'
    end
  end
end

Interface.new.create_game
