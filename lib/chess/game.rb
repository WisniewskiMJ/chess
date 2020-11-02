class Game

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {player1: Player.new(:white, @board, @display),
                player2: Player.new(:black, @board, @display)}
    @current_player = @players[:player1]
  end

  def play
    clear
    puts "New game"
    @display.render
    while true
      clear
      notify_players
      player_move
      clear
      @display.render
      sleep(2)
      break if game_over?
      swap_turn
    end
    puts "#{@current_player} wins"
    play_again?
  end

  def notify_players
    puts "#{@current_player} move"
  end

  def player_move
    @current_player.make_move
  

  end

  def swap_turn
    if @current_player == @players[:player1]
      @current_player = @players[:player2]
    else
      @current_player = @players[:player1]
    end
  end

  def game_over?

  end

  def play_again?

  end

  def clear
    system 'clear'
  end
end

if __FILE__ == $PROGRAM_NAME
  load "../chess.rb"
  game = Game.new
  game.play
end
