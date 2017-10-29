require_relative './card'
require_relative './deck'

class Hand
  VICTORY_POINTS = 21

  attr_reader :points, :cards

  def initialize
    @cards = []
    @points = 0
  end

  def add_card(deck)
    unless cards_amount?
      card = deck.take_card
      cards << card
      ace_check!(card)
    else
      'No more than 3 cards'
    end 
  end

  def show_cards
    result = ""
    cards.each { |card| result << "#{card.sign} " }
    result
  end

  def ace_check!(card)
    value = card.value
    value == 11 && points > 10 ? points += 1 : @points += value         
  end

  def cards_amount?
    cards.size == 3
  end
end