# frozen_string_literal: true

require_relative 'board'

class Piece
  attr_accessor :pos
  attr_reader :board, :color, :symbol

  def initialize(pos, board)
    @pos = pos
    @board = board
    @color = set_color
    @symbol = set_symbol
  end

  private

  def set_color
    (@pos[0]).zero? || @pos[0] == 1 ? :black : :white
  end

  def set_symbol
    @color == :black ? :x : :X
  end
end
