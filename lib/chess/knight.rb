# frozen_string_literal: true

class Knight < Piece
  include Stepable

  def set_color
    (@pos[0]).zero? ? :black : :white
  end

  def set_symbol
    @color == :black ? :n : :N
  end

  def move_diffs
    [[1, 2],
     [1, -2],
     [-1, 2],
     [-1, -2],
     [2, 1],
     [2, -1],
     [-2, 1],
     [-2, -1]]
  end
end
