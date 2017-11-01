class Card
  VALUES = { 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11 }.freeze

  attr_reader :value, :sign

  def initialize(sign, suit)
    @sign = sign.to_s + suit
    @value = VALUES[sign] || sign
  end
end
