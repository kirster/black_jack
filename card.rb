class Card
  CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  SUITS = ['+', '<', '^', '<>']

  attr_reader :card_value, :card

  def initialize
    card = CARDS.shuffle.sample
    suit = SUITS.shuffle.sample
    @card = card.to_s + suit
    @card_value = define_value(card)
  end

  def define_value(card)
    case card
      when 2..10 then card
      when 'J', 'Q', 'K' then 10
      when 'A' then 11       
    end
  end
end
