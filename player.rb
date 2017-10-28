require_relative './betting'

class Player
  include Betting
  
  attr_reader :name, :bank, :hand

  def initialize(name)
    @name = name
    @bank = 100
    @hand = []
    validate!
  end

  protected

  def validate!
    raise "Name can`be nill or empty" if name.nil? || name.empty?  
  end
end