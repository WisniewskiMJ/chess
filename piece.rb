require_relative "board"

class Piece

  attr_writer :pos

  def initialize(pos, board)
    @pos = pos
    @board = board
  end

end
