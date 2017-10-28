require_relative './betting'

class Dealer
  include Betting
  
  attr_reader :name, :bank, :hand

  def initialize
    @name = 'Dealer'
    @bank = 100
    @hand = []
  end
end