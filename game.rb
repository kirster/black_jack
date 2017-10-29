require_relative './dealer'
require_relative './player'
require_relative './deck'

class Game
  attr_reader :game_bank, :dealer, :player, :deck

  def game_menu
  ' 
    1 - skip move
    ------------------
    2 - add a card
    ------------------
    3 - show cards 
                      ' 
  end

  def start_game
    puts 'Start new game - 1, quit - 2'
    answer = gets.chomp.to_i
    if answer == 1
      @game_bank = 0
      @deck = Deck.new
      @dealer = Dealer.new
      puts 'Enter your name: '
      name = gets.chomp
      @player = Player.new(name)
      first_round
      game_process
    else
      puts 'You finished playing Black Jack'
    end 
  end

  private

  def first_round
    2.times { player.hand.add_card(deck) }
    puts player.info
    player.bank -= 10

    2.times { dealer.hand.add_card(deck) }
    puts "#{dealer.name}: * *"
    dealer.bank -= 10

    @game_bank += 20
  end

  def game_process
    puts game_menu

    until player.hand.cards_amount? && dealer.hand.cards_amount?  
      puts 'Enter command:'
      command = gets.chomp.to_i
      case command
        when 1
          player.skip_move
          dealer.logic(deck)
        when 2
          player.hand.add_card(deck)
          puts player.info
          dealer.logic(deck)
        when 3
          break
      end
    end
    result
  end

  def result
    puts player.info
    puts dealer.info
  end
end

game = Game.new
game.start_game