# frozen_string_literal: true

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = { player1: Player.new(:white, @board, @display),
                 player2: Player.new(:black, @board, @display) }
    @current_player = @players[:player1]
  end

  def play
    clear
    puts 'New game'
    @display.render
    loop do
      player_move
      clear
      @display.render
      break if game_over?

      swap_turn
      clear
    end
    puts "#{@current_player} wins"
    play_again?
  end

  def notify_players
    puts @current_player.to_s + ' move'
  end

  def player_move
    @current_player.make_move
  end

  def swap_turn
    @current_player = if @current_player == @players[:player1]
                        @players[:player2]
                      else
                        @players[:player1]
                      end
  end

  def game_over?; end

  def play_again?; end

  def clear
    system 'clear'
  end
end

if __FILE__ == $PROGRAM_NAME
  load '../chess.rb'
  game = Game.new
  game.play
end
