# frozen_string_literal: true

class Player
  def initialize(color, board, display)
    @color = color
    @board = board
    @display = display
  end

  def make_move
    positions = positions_get
    @board.move_piece(positions[0], positions[1], @color)
  rescue RuntimeError => e
    puts e.message
    sleep(2)
    retry
  end

  def positions_get
    positions = []
    until positions.length > 1
      system 'clear'
      @display.render
      puts '      ' + to_s + ' move'
      input = @display.cursor.get_input
      positions << input if input.is_a?(Array)
    end
    positions
  end

  def to_s
    @color.to_s.capitalize
  end
end
