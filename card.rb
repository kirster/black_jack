class Card
  attr_reader :value, :sign

  def initialize(sign, suit)
    @sign = sign.to_s + suit
    @value = define_value(sign)
  end

  def define_value(sign)
    case sign
    when 2..10 then sign
    when 'J', 'Q', 'K' then 10
    when 'A' then 11
    end
  end
end
