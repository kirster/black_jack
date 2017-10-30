class User
  INITIAL_BANK = 100

  attr_reader :name, :hand, :skipped
  attr_accessor :bank

  def initialize(name)
    @name = name
    @bank = INITIAL_BANK
    @hand = Hand.new
  end

  def skip_move
    puts "#{name} skips move"
    @skipped = true
  end

  def info
    "#{name}: bank: #{bank}, #{hand.show_cards}, points: #{hand.points}"
  end

  def enough_bank?
    bank == 0
  end

  def next_turn
    @skipped = false
    @hand = Hand.new
  end

  def points
    hand.points
  end
end