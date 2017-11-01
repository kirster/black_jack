require_relative './card'

class Hand
  attr_reader :points, :cards

  def initialize
    @cards = []
    @points = 0
  end

  def add_card(card)
    cards << card
    ace_check!(cards.last)
  end

  def show_cards
    result = ''
    cards.each { |card| result << "#{card.sign} " }
    result
  end

  def ace_check!(card)
    value = card.value
    @points += value == 11 && points > 10 ? 1 : value
  end

  def cards_amount?
    cards.size == 3
  end
end
