module Common
  def make_bet
    @bank -= 10
  end

  def add_card
    card = Card.new
    @hand << card
    @points ||= 0
    @points += card.card_value
  end

  def cards
    @hand.each { |card| puts "#{card.card}" }
  end
end
