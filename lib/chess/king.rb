# frozen_string_literal: true

class King < Piece
  include Stepable

  def set_color
    (@pos[0]).zero? ? :black : :white
  end

  def set_symbol
    @color == :black ? :k : :K
  end

  def move_diffs
    [[0, 1],
     [0, -1],
     [1, 0],
     [-1, 0],
     [1, 1],
     [-1, 1],
     [1, -1],
     [-1, -1]]
  end
end
