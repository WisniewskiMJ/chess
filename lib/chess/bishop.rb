# frozen_string_literal: true

class Bishop < Piece
  include Slideable

  def set_color
    (@pos[0]).zero? ? :black : :white
  end

  def set_symbol
    @color == :black ? :b : :B
  end

  def move_dirs
    diagonal_dirs
  end
end
