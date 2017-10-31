require_relative './dealer'
require_relative './player'
require_relative './deck'

class Game
  attr_reader :dealer, :player, :deck, :game_bank

  def game_menu
    puts '1 - skip move' unless player.skipped
    puts '2 - add a card' if player.hand.cards.size < 3
    puts '3 - show cards'
    print 'Enter command:'
  end

  def new_game
    puts 'Start new game - 1, quit - 0'
    if gets.chomp.to_i == 1
      @game_bank = 0
      @deck = Deck.new
      @dealer = Dealer.new
      puts 'Enter your name: '
      name = gets.chomp
      @player = Player.new(name)
      game_process
    else
      puts 'You finished playing Black Jack'
    end
  end

  private

  def game_process
    loop do
      break if player.enough_bank? || dealer.enough_bank? || deck.enough_cards?
      first_round
      one_turn
    end
    new_game
  end

  def one_turn
    cards_shown = false
    until player.hand.cards_amount? && dealer.hand.cards_amount?
      puts game_menu
      command = gets.chomp.to_i
      case command
      when 1
        player.skip_move
      when 2
        player.hand.add_card(deck)
        puts player.info
      when 3
        cards_shown = true
        break
      end
      dealer.logic(deck) unless cards_shown
    end
    result
    player.next_turn
    dealer.next_turn
    @game_bank = 0
  end

  def first_round
    puts '=================================='
    puts 'New turn'
    player.bank -= 10
    2.times { player.hand.add_card(deck) }
    puts player.info

    dealer.bank -= 10
    2.times { dealer.hand.add_card(deck) }
    puts "#{dealer.name}: * *"

    @game_bank += 20
  end

  def result
    if drawn?
      puts 'Drawn for this turn'
      dealer.bank += game_bank / 2
      player.bank += game_bank / 2
    elsif player_win?
      puts 'Player wins this turn'
      player.bank += game_bank
    else
      puts 'Dealer wins this turn'
      dealer.bank += game_bank
    end
    puts player.info
    puts dealer.info
  end

  def drawn?
    dealer.points > 21 && player.points > 21 || 
    dealer.points == player.points
  end

  def player_win?
    dealer.points < player.points && player.points <= 21 || 
    dealer.points > player.points && dealer.points > 21
  end
end

game = Game.new
game.new_game
