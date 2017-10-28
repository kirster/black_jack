require_relative './card'

class Hand
  attr_reader :points

  def initialize
    @cards = []
  end

  def add_card
    card = Card.new
    @cards << card
    @points ||= 0
    @points += card.card_value
  end

  def cards
    result = ""
    @cards.each { |card| result << "#{card.card} " }
    result
  end
end