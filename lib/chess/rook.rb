# frozen_string_literal: true

class Rook < Piece
  include Slideable

  def set_color
    (@pos[0]).zero? ? :black : :white
  end

  def set_symbol
    @color == :black ? :r : :R
  end

  def move_dirs
    horizontal_dirs
  end
end
