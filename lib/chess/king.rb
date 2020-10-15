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
    step_x = 1
    step_y = 1
    [step_x, step_y]
  end
end
