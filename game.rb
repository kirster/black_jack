require_relative './dealer'
require_relative './player'
require_relative './deck'
require_relative './interface'

class Game
  attr_reader :dealer, :player, :deck, :game_bank

  def initialize(name)
    @game_bank = 0
    @deck = Deck.new
    @dealer = Dealer.new
    @player = Player.new(name)
  end

  def game_process
    loop do
      break if player.enough_bank? || dealer.enough_bank? || deck.enough_cards?
      one_turn
    end
    Interface.new.start_game
  end

  private

  def menu
    puts '1 - skip move' unless player.skipped
    puts '2 - add a card' if player.hand.cards.size < 3
    puts '3 - show cards'
    print 'Enter command:'
  end

  def one_turn
    cards_shown = false
    first_round

    until player.hand.cards_amount? && dealer.hand.cards_amount?
      puts menu
      command = gets.chomp.to_i
      case command
      when 1
        player.skip_move
      when 2
        player.take_card(deck)
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
    2.times { player.take_card(deck) }
    puts player.info

    dealer.bank -= 10
    2.times { dealer.take_card(deck) }
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
