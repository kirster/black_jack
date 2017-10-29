class User
  INITIAL_BANK = 100

  attr_reader :name, :hand
  attr_accessor :bank

  def initialize(name)
    @name = name
    @bank = INITIAL_BANK
    @hand = Hand.new
  end

  def skip_move
    puts "#{name} skips move"
  end

  def info_for_user
    "#{name}: #{hand.show_cards}, points: #{hand.points}"
  end
end