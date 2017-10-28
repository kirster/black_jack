require_relative './hand'

class Dealer
  attr_reader :name, :hand
  attr_accessor :bank

  def initialize
    @name = 'Dealer'
    @bank = 100
    @hand = Hand.new
  end
end
