class Player

  def initialize(color, board, display)
    @color = color
    @board = board
    @display = display
  end

  def make_move
    positions = get_positions
    @board.move_piece(positions[0], positions[1])
  rescue RuntimeError => e
    puts e.message
    sleep(2)
    retry
  end

  def get_positions
    positions = []
    until positions.length > 1
      system 'clear'
      @display.render
      input = @display.cursor.get_input
      puts input
      positions <<  input if input.is_a?(Array)
      p positions
    end
    positions
  end
end
