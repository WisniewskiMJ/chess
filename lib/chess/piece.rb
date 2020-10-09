# frozen_string_literal: true

require_relative 'board'

class Piece
  attr_accessor :pos

  def initialize(pos, board)
    @pos = pos
    @board = board
  end
end
