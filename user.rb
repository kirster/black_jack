require_relative './hand'
require_relative './deck'

class User
  INITIAL_BANK = 100

  attr_reader :name, :hand, :skipped
  attr_accessor :bank

  def initialize(name)
    @name = name
    @bank = INITIAL_BANK
    @hand = Hand.new
  end

  def take_card(deck)
    hand.add_card(deck.card)
  end

  def skip_move
    puts "#{name} skips move"
    @skipped = true
  end

  def info
    "#{name}: bank #{bank}, #{hand.show_cards}, points: #{hand.points}"
  end

  def enough_bank?
    bank >= 10
  end

  def new_turn
    @skipped = false
    @hand = Hand.new
  end

  def points
    hand.points
  end
end
