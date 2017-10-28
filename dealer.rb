require_relative './hand'
require_relative './user'

class Dealer < User
  def initialize(name = 'Dealer')
    super
  end
end
