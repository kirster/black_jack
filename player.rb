require_relative './common'

class Player
  include Common

  attr_reader :name, :bank, :hand, :points

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
