class Player
  attr_reader :name, :bank, :hand

  def initialize(name)
    @name = name
    @bank = 100
    @hand = []
    valiadate!
  end

  protected

  def valiadate!
    raise "Name can`be nill or empty" if name.nil? || name.empty?  
  end
end