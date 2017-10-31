require_relative './game'

class Interface
  def start_game
    puts 'Start new game - 1, quit - 0'
    if gets.chomp.to_i == 1
      puts 'Enter your name: '
      name = gets.chomp
      game = Game.new(name)
      game.game_process
    else
      puts 'You finished playing Black Jack'
    end
  end
end

Interface.new.start_game