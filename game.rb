require_relative './dealer'
require_relative './player'
require_relative './deck'

class Game
  attr_reader :dealer, :player, :deck, :game_bank

  def game_menu
    puts '1 - skip move' unless player.skipped
    puts '2 - add a card' if player.hand.cards.size < 3
    puts '3 - show cards'
    print 'Enter command:'
  end

  def new_game
    puts 'Start new game - 1, quit - 0'
    if gets.chomp.to_i == 1
      @game_bank = 0
      @deck = Deck.new
      @dealer = Dealer.new
      puts 'Enter your name: '
      name = gets.chomp
      @player = Player.new(name)
      game_process
    else
      puts 'You finished playing Black Jack'
    end
  end

  private

  def game_process
    loop do
      break if player.enough_bank? || dealer.enough_bank? || deck.enough_cards?
      first_round
      one_turn
    end
    new_game
  end

  def one_turn
    until player.hand.cards_amount? && dealer.hand.cards_amount?
      puts game_menu
      command = gets.chomp.to_i
      case command
      when 1
        player.skip_move
        dealer.logic(deck)
      when 2
        player.hand.add_card(deck)
        puts player.info
        dealer.logic(deck)
      when 3
        break
      end
    end
    result
    player.next_turn
    dealer.next_turn
  end

  def first_round
    puts '=================================='
    puts 'New turn'
    player.bank -= 10
    2.times { player.hand.add_card(deck) }
    puts player.info

    dealer.bank -= 10
    2.times { dealer.hand.add_card(deck) }
    puts "#{dealer.name}: * *"

    @game_bank += 20
  end

  def result
    winner
    puts player.info
    puts dealer.info
  end

  def winner
    d_pt = dealer.points
    p_pt = player.points

    if d_pt > 21 && p_pt > 21 || d_pt == p_pt
      puts 'Drawn for this turn'
      dealer.bank += game_bank / 2
      player.bank += game_bank / 2
    elsif d_pt < p_pt && p_pt <= 21 || d_pt > p_pt && d_pt > 21
      puts 'Player wins this turn'
      player.bank += game_bank
    else
      puts 'Dealer wins this turn'
      dealer.bank += game_bank
    end
    @game_bank = 0
  end
end

game = Game.new
game.new_game
