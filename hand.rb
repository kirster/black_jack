require_relative './card'

class Hand
  VICTORY_POINTS = 21

  attr_reader :points

  def initialize
    @cards = []
    @points = 0
  end

  def add_card
    if @cards.size < 3
      card = Card.new
      @cards << card
      ace_check!(card)
    else
      'No more than 3 cards'
    end 
  end

  def cards
    result = ""
    @cards.each { |card| result << "#{card.card} " }
    result
  end

  def ace_check!(card)
    value = card.card_value
    value == 11 && @points > 10 ? @points += 1 : @points += value         
  end
end