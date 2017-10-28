require_relative './hand'

class Player
  attr_reader :name, :hand
  attr_accessor :bank

  def initialize(name)
    @name = name
    @bank = 100
    @hand = Hand.new
    validate!
  end

  protected

  def validate!
    raise "Name can`be nill or empty" if name.nil? || name.empty?  
  end
end
