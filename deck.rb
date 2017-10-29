require_relative './card'

class Deck
  SIGNS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  SUITS = ['+', '<', '^', '<>']

  attr_reader :deck

  def initialize
    @deck = create_deck
  end

  def create_deck
    deck = []
    SUITS.each do |suit|
      SIGNS.each { |sign| deck << Card.new(sign,suit) }
    end
    deck.shuffle
  end

  def take_card
    deck.delete(deck.sample)
  end
end
