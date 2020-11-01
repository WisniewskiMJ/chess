# frozen_string_literal: true

class Piece
  attr_accessor :pos
  attr_reader :board, :color, :symbol

  def initialize(pos, board)
    @pos = pos
    @board = board
    @color = set_color
    @symbol = set_symbol
  end

  def valid_moves
    moves.select {|move| @board.on_chessboard?(move) && @board.valid_target?(move, @color) && !move_into_check?(move)}
  end

  def move_into_check?(move)
    dupped_board = @board.board_dup
    dupped_board.move_piece!(@pos, move)
    dupped_board.in_check?(@color)
  end

  private

  def set_color
    (@pos[0]).zero? || @pos[0] == 1 ? :black : :white
  end

  def set_symbol
    @color == :black ? :x : :X
  end
end
