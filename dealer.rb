require_relative './common'

class Dealer
  include Common

  attr_reader :name, :bank, :hand, :points

  def initialize
    @name = 'Dealer'
    @bank = 100
    @hand = []
  end

  def hidden_cards
    "**"
  end
end
