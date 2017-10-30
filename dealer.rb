require_relative './hand'
require_relative './user'

class Dealer < User
  def initialize(name = 'Dealer')
    super
  end

  def logic(deck)
    if hand.points >= 18 && !skipped
      skip_move
    else
      puts "#{name} takes a card"
      hand.add_card(deck)
    end
  end
end
