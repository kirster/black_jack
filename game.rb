require_relative './dealer'
require_relative './player'
require_relative './deck'

class Game
  attr_reader :dealer, :player, :deck, :game_bank, :interface, :turn_winner

  def initialize(name)
    @game_bank = 0
    @deck = Deck.new
    @dealer = Dealer.new
    @player = Player.new(name)
  end

  def connect_interface(interface)
    @interface = interface
  end

  def setup_turn
    @turn_winner = nil
    player.new_turn
    dealer.new_turn
  end

  def one_turn
    cards_shown = false
    until player.hand.cards_amount? && dealer.hand.cards_amount?
      case interface.user_input
      when 1
        player.skip_move
      when 2
        player.take_card(deck)
      when 3
        cards_shown = true
        break
      end
      dealer.logic(deck) unless cards_shown
    end
    result
    @game_bank = 0
  end

  def first_round
    player.bank -= 10
    2.times { player.take_card(deck) }
    dealer.bank -= 10
    2.times { dealer.take_card(deck) }
    @game_bank += 20
  end

  def result
    if drawn?
      dealer.bank += game_bank / 2
      player.bank += game_bank / 2
      @turn_winner = 'drawn'
    elsif player_win?
      player.bank += game_bank
      @turn_winner = 'player'
    else
      dealer.bank += game_bank
      @turn_winner = 'dealer'
    end
  end

  def game_stop?
    player.enough_bank? || dealer.enough_bank? || deck.enough_cards?
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
