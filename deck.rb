require_relative './card'

class Deck
  attr_reader :deck

  def initialize
    @deck = create_deck
  end

  def create_deck
    deck = []
    %w(+ < ^ <>).each do |suit|
      (2..10).each { |sign| deck << Card.new(sign, suit) }  
      %w(J Q K A).each { |sign| deck << Card.new(sign, suit) }
    end
    deck.shuffle
  end

  def get_card
    deck.delete(deck.sample)
  end

  def enough_cards?
    deck.empty?
  end
end
