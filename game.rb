require_relative './dealer'
require_relative './player'
require_relative './deck'

class Game
  attr_reader :dealer, :player, :deck, :game_bank, :turn_winner, :cards_shown

  def initialize(name)
    @game_bank = 0
    @deck = Deck.new
    @dealer = Dealer.new
    @player = Player.new(name)
  end

  def setup_turn
    @turn_winner
    @cards_shown = false
    player.new_turn
    dealer.new_turn
  end

  def first_round
    setup_turn
    player.bank -= 10
    2.times { player.take_card(deck) }
    dealer.bank -= 10
    2.times { dealer.take_card(deck) }
    @game_bank += 20
  end

  def one_turn(action)
    case action
    when :skip
      player.skip_move
    when :add
      player.take_card(deck)
    when :show
      @cards_shown = true
    end
    dealer.move(deck) unless cards_shown
    result if stop_turn?
  end

  def result
    if drawn?
      dealer.bank += game_bank / 2
      player.bank += game_bank / 2
      @turn_winner = :drawn
    elsif player_win?
      player.bank += game_bank
      @turn_winner = :player
    else
      dealer.bank += game_bank
      @turn_winner = :dealer
    end
    @game_bank = 0
  end

  def stop_turn?
    player.hand.full_hand? && dealer.hand.full_hand? || cards_shown
  end

  def game_continue?
    player.enough_bank? && dealer.enough_bank? && deck.enough_cards?
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
